import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orta/features/features.dart';

class TestGetItemsBloc extends GetItemsBloc<int, void> {
  TestGetItemsBloc({
    required List<Either<AppError, PaginatedResponse<int>>> responses,
    super.initialState,
  }) : _responses = responses;

  final List<Either<AppError, PaginatedResponse<int>>> _responses;

  @override
  Future<Either<AppError, PaginatedResponse<int>>> makeRequest({
    required String searchQuery,
    int offset = 0,
    int limit = 10,
    void optionalData,
    bool bypassCache = true,
  }) async {
    return _responses.removeAt(0);
  }

  @override
  bool itemEquals(int item1, int item2) => item1 == item2;
}

void main() {
  PaginatedResponse<int> response({
    required List<int> items,
    required int currentPage,
    required bool hasNextPage,
    int limit = 2,
  }) {
    return PaginatedResponse<int>(
      data: items,
      currentPage: currentPage,
      totalPages: hasNextPage ? currentPage + 1 : currentPage,
      totalCount: items.length,
      hasNextPage: hasNextPage,
      hasPrevPage: currentPage > 1,
      limit: limit,
    );
  }

  group('GetItemsBloc', () {
    test('getItems emits success and completes true', () async {
      final TestGetItemsBloc bloc = TestGetItemsBloc(
        responses: <Either<AppError, PaginatedResponse<int>>>[
          right<AppError, PaginatedResponse<int>>(
            response(items: <int>[1, 2], currentPage: 1, hasNextPage: true),
          ),
        ],
      );

      final bool completed = await bloc.getItems(limit: 2);

      expect(completed, isTrue);
      expect(bloc.state, isA<GetItemsSuccess<int>>());
      expect(bloc.state.response?.data, equals(<int>[1, 2]));
      await bloc.close();
    });

    test('getItems emits failure and completes false', () async {
      final TestGetItemsBloc bloc = TestGetItemsBloc(
        responses: <Either<AppError, PaginatedResponse<int>>>[
          left<AppError, PaginatedResponse<int>>(const AppError('Failed')),
        ],
      );

      final bool completed = await bloc.getItems();

      expect(completed, isFalse);
      expect(bloc.state, isA<GetItemsFailure<int>>());
      expect(bloc.state.failure?.message, 'Failed');
      await bloc.close();
    });

    test('loadMore appends the next page', () async {
      final TestGetItemsBloc bloc = TestGetItemsBloc(
        responses: <Either<AppError, PaginatedResponse<int>>>[
          right<AppError, PaginatedResponse<int>>(
            response(items: <int>[1, 2], currentPage: 1, hasNextPage: true),
          ),
          right<AppError, PaginatedResponse<int>>(
            response(items: <int>[3], currentPage: 2, hasNextPage: false),
          ),
        ],
      );

      expect(await bloc.getItems(limit: 2), isTrue);
      expect(await bloc.loadMore(), isTrue);

      expect(bloc.state.response?.data, equals(<int>[1, 2, 3]));
      expect(bloc.state.canLoadMore, isFalse);
      await bloc.close();
    });

    test(
      'getItems completes true without refetching cached identical search',
      () async {
        final GetItemsState<int> cachedState = GetItemsState<int>.success(
          response: response(
            items: <int>[1],
            currentPage: 1,
            hasNextPage: false,
          ),
          searchQuery: 'care',
          offset: 1,
          limit: 10,
          hiddenItems: <int>[],
          shownItems: <int>[],
        );
        final TestGetItemsBloc bloc = TestGetItemsBloc(
          initialState: cachedState,
          responses: <Either<AppError, PaginatedResponse<int>>>[],
        );

        final bool completed = await bloc.getItems(
          offset: 1,
          searchQuery: 'CARE',
          bypassCache: false,
        );

        expect(completed, isTrue);
        expect(bloc.state, cachedState);
        await bloc.close();
      },
    );
  });
}
