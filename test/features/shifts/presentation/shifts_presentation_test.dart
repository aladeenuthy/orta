import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

import '../shift_test_helpers.dart';

class MockShiftsService extends Mock implements ShiftsService {}

void main() {
  late MockShiftsService shiftsService;

  PaginatedResponse<Shift> paginatedResponse({
    required List<Shift> shifts,
    required int currentPage,
    required bool hasNextPage,
    int limit = 10,
  }) {
    return PaginatedResponse<Shift>(
      data: shifts,
      currentPage: currentPage,
      totalPages: hasNextPage ? currentPage + 1 : currentPage,
      totalCount: shifts.length,
      hasNextPage: hasNextPage,
      hasPrevPage: currentPage > 1,
      limit: limit,
    );
  }

  setUp(() {
    shiftsService = MockShiftsService();
  });

  group('MyShiftsBloc', () {
    blocTest<MyShiftsBloc, GetItemsState<Shift>>(
      'emits loading and success when get my shifts succeeds',
      build: () {
        when(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 10,
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.asc,
          ),
        ).thenAnswer(
          (_) async => Right<AppError, PaginatedResponse<Shift>>(
            paginatedResponse(
              shifts: <Shift>[shiftModel()],
              currentPage: 1,
              hasNextPage: false,
            ),
          ),
        );
        return MyShiftsBloc(shiftsService: shiftsService);
      },
      act: (MyShiftsBloc bloc) => bloc.filterShifts(
        page: 1,
        limit: 10,
        filters: const ShiftFilters(
          status: ShiftStatusFilter.active,
          sortBy: ShiftSortBy.date,
          sortOrder: ShiftSortOrder.asc,
        ),
      ),
      expect: () => <Matcher>[
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsSuccess<Shift>>()
            .having(
              (GetItemsSuccess<Shift> state) => state.response.data,
              'data',
              hasLength(1),
            )
            .having(
              (GetItemsSuccess<Shift> state) => state.canLoadMore,
              'canLoadMore',
              isFalse,
            ),
      ],
      verify: (_) {
        verify(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 10,
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.asc,
          ),
        ).called(1);
      },
    );

    blocTest<MyShiftsBloc, GetItemsState<Shift>>(
      'persists filters and uses them when loading more',
      build: () {
        when(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 10,
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          ),
        ).thenAnswer(
          (_) async => Right<AppError, PaginatedResponse<Shift>>(
            paginatedResponse(
              shifts: <Shift>[shiftModel(id: 'shift-1')],
              currentPage: 1,
              hasNextPage: true,
            ),
          ),
        );
        when(
          () => shiftsService.getMyShifts(
            page: 2,
            limit: 10,
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          ),
        ).thenAnswer(
          (_) async => Right<AppError, PaginatedResponse<Shift>>(
            paginatedResponse(
              shifts: <Shift>[shiftModel(id: 'shift-2')],
              currentPage: 2,
              hasNextPage: false,
            ),
          ),
        );
        return MyShiftsBloc(shiftsService: shiftsService);
      },
      act: (MyShiftsBloc bloc) async {
        await bloc.filterShifts(
          page: 1,
          limit: 10,
          filters: const ShiftFilters(
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          ),
        );
        await bloc.loadMoreShifts();
      },
      expect: () => <Matcher>[
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsSuccess<Shift>>(),
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsSuccess<Shift>>().having(
          (GetItemsSuccess<Shift> state) => state.response.data,
          'data',
          hasLength(2),
        ),
      ],
      verify: (_) {
        verify(
          () => shiftsService.getMyShifts(
            page: 2,
            limit: 10,
            status: ShiftStatusFilter.active,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          ),
        ).called(1);
      },
    );

    blocTest<MyShiftsBloc, GetItemsState<Shift>>(
      'appends shifts when load more succeeds',
      build: () {
        when(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 10,
            status: null,
            sortBy: null,
            sortOrder: null,
          ),
        ).thenAnswer(
          (_) async => Right<AppError, PaginatedResponse<Shift>>(
            paginatedResponse(
              shifts: <Shift>[shiftModel(id: 'shift-1')],
              currentPage: 1,
              hasNextPage: true,
            ),
          ),
        );
        when(
          () => shiftsService.getMyShifts(
            page: 2,
            limit: 10,
            status: null,
            sortBy: null,
            sortOrder: null,
          ),
        ).thenAnswer(
          (_) async => Right<AppError, PaginatedResponse<Shift>>(
            paginatedResponse(
              shifts: <Shift>[shiftModel(id: 'shift-2')],
              currentPage: 2,
              hasNextPage: false,
            ),
          ),
        );
        return MyShiftsBloc(shiftsService: shiftsService);
      },
      act: (MyShiftsBloc bloc) async {
        await bloc.getMyShifts(page: 1, limit: 10);
        await bloc.loadMoreShifts();
      },
      expect: () => <Matcher>[
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsSuccess<Shift>>(),
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsSuccess<Shift>>()
            .having(
              (GetItemsSuccess<Shift> state) => state.response.data,
              'data',
              hasLength(2),
            )
            .having(
              (GetItemsSuccess<Shift> state) => state.canLoadMore,
              'canLoadMore',
              isFalse,
            ),
      ],
    );

    blocTest<MyShiftsBloc, GetItemsState<Shift>>(
      'emits failure when get my shifts fails',
      build: () {
        when(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 10,
            status: null,
            sortBy: null,
            sortOrder: null,
          ),
        ).thenAnswer(
          (_) async => const Left<AppError, PaginatedResponse<Shift>>(
            AppError('Unable to load shifts'),
          ),
        );
        return MyShiftsBloc(shiftsService: shiftsService);
      },
      act: (MyShiftsBloc bloc) => bloc.getMyShifts(page: 1, limit: 10),
      expect: () => <Matcher>[
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsFailure<Shift>>().having(
          (GetItemsFailure<Shift> state) => state.failure.message,
          'message',
          'Unable to load shifts',
        ),
      ],
    );
  });

  group('ShiftDetailCubit', () {
    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'emits loading and loaded when shift detail succeeds',
      build: () {
        when(
          () => shiftsService.getShiftDetail('shift-id'),
        ).thenAnswer((_) async => Right<AppError, Shift>(shiftModel()));
        return ShiftDetailCubit(shiftsService: shiftsService);
      },
      act: (ShiftDetailCubit cubit) => cubit.getShiftDetail('shift-id'),
      expect: () => <ShiftDetailState>[
        const ShiftDetailState(viewState: ViewState.loading),
        ShiftDetailState(viewState: ViewState.loaded, shift: shiftModel()),
      ],
    );

    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'emits loading and error when shift detail fails',
      build: () {
        when(() => shiftsService.getShiftDetail('shift-id')).thenAnswer(
          (_) async => const Left<AppError, Shift>(AppError('Not found')),
        );
        return ShiftDetailCubit(shiftsService: shiftsService);
      },
      act: (ShiftDetailCubit cubit) => cubit.getShiftDetail('shift-id'),
      expect: () => <ShiftDetailState>[
        const ShiftDetailState(viewState: ViewState.loading),
        const ShiftDetailState(
          viewState: ViewState.error,
          errorMessage: 'Not found',
        ),
      ],
    );

    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'resets error message',
      build: () => ShiftDetailCubit(shiftsService: shiftsService),
      seed: () => const ShiftDetailState(
        viewState: ViewState.error,
        errorMessage: 'Not found',
      ),
      act: (ShiftDetailCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <ShiftDetailState>[const ShiftDetailState()],
    );
    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'emits loading and loaded when cancel succeeds',
      build: () {
        when(
          () => shiftsService.cancelShift('shift-id'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ShiftDetailCubit(shiftsService: shiftsService);
      },
      seed: () =>
          ShiftDetailState(viewState: ViewState.loaded, shift: shiftModel()),
      act: (ShiftDetailCubit cubit) => cubit.cancelShift('shift-id'),
      expect: () => <ShiftDetailState>[
        ShiftDetailState(
          viewState: ViewState.loading,
          shift: shiftModel(),
          action: ShiftDetailAction.cancel,
        ),
        ShiftDetailState(
          viewState: ViewState.loaded,
          shift: shiftModel(),
          action: ShiftDetailAction.cancel,
        ),
      ],
    );

    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'emits loading and loaded when clock in succeeds',
      build: () {
        when(
          () => shiftsService.clockIn('shift-id'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ShiftDetailCubit(shiftsService: shiftsService);
      },
      act: (ShiftDetailCubit cubit) => cubit.clockIn('shift-id'),
      expect: () => <ShiftDetailState>[
        const ShiftDetailState(
          viewState: ViewState.loading,
          action: ShiftDetailAction.clockIn,
        ),
        const ShiftDetailState(
          viewState: ViewState.loaded,
          action: ShiftDetailAction.clockIn,
        ),
      ],
    );

    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'emits loading and loaded when clock out succeeds',
      build: () {
        when(
          () => shiftsService.clockOut('shift-id'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ShiftDetailCubit(shiftsService: shiftsService);
      },
      act: (ShiftDetailCubit cubit) => cubit.clockOut('shift-id'),
      expect: () => <ShiftDetailState>[
        const ShiftDetailState(
          viewState: ViewState.loading,
          action: ShiftDetailAction.clockOut,
        ),
        const ShiftDetailState(
          viewState: ViewState.loaded,
          action: ShiftDetailAction.clockOut,
        ),
      ],
    );

    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'emits loading and error when an action fails',
      build: () {
        when(() => shiftsService.clockOut('shift-id')).thenAnswer(
          (_) async => const Left<AppError, Unit>(AppError('Too early')),
        );
        return ShiftDetailCubit(shiftsService: shiftsService);
      },
      act: (ShiftDetailCubit cubit) => cubit.clockOut('shift-id'),
      expect: () => <ShiftDetailState>[
        const ShiftDetailState(
          viewState: ViewState.loading,
          action: ShiftDetailAction.clockOut,
        ),
        const ShiftDetailState(
          viewState: ViewState.error,
          action: ShiftDetailAction.clockOut,
          errorMessage: 'Too early',
        ),
      ],
    );

    blocTest<ShiftDetailCubit, ShiftDetailState>(
      'resets action error message',
      build: () => ShiftDetailCubit(shiftsService: shiftsService),
      seed: () => const ShiftDetailState(
        viewState: ViewState.error,
        action: ShiftDetailAction.clockOut,
        errorMessage: 'Too early',
      ),
      act: (ShiftDetailCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <ShiftDetailState>[
        const ShiftDetailState(action: ShiftDetailAction.clockOut),
      ],
    );
  });
}
