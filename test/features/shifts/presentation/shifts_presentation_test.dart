import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:orta/features/features.dart';

import '../shift_test_helpers.dart';

class MockShiftsService extends Mock implements ShiftsService {}

class MockLocationService extends Mock implements LocationService {}

void main() {
  late MockShiftsService shiftsService;
  late MockLocationService locationService;

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
    locationService = MockLocationService();
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

  group('PaginatedShiftsBloc', () {
    blocTest<PaginatedShiftsBloc, GetItemsState<Shift>>(
      'fetchInitial emits loaded shifts with configured filters and limit',
      build: () {
        when(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 3,
            status: ShiftStatusFilter.inProgress,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          ),
        ).thenAnswer(
          (_) async => Right<AppError, PaginatedResponse<Shift>>(
            paginatedResponse(
              shifts: <Shift>[shiftModel(id: 'shift-1')],
              currentPage: 1,
              hasNextPage: false,
              limit: 3,
            ),
          ),
        );

        return PaginatedShiftsBloc(
          shiftsService: shiftsService,
          filters: const ShiftFilters(
            status: ShiftStatusFilter.inProgress,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          ),
          limit: 3,
        );
      },
      act: (PaginatedShiftsBloc bloc) => bloc.fetchInitial(),
      expect: () => <Matcher>[
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsSuccess<Shift>>()
            .having(
              (GetItemsSuccess<Shift> state) => state.response.data,
              'shifts',
              hasLength(1),
            )
            .having(
              (GetItemsSuccess<Shift> state) => state.canLoadMore,
              'hasNextPage',
              isFalse,
            ),
      ],
      verify: (_) {
        verify(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 3,
            status: ShiftStatusFilter.inProgress,
            sortBy: ShiftSortBy.date,
            sortOrder: ShiftSortOrder.desc,
          ),
        ).called(1);
      },
    );

    blocTest<PaginatedShiftsBloc, GetItemsState<Shift>>(
      'loadMore appends the next page',
      build: () {
        when(
          () => shiftsService.getMyShifts(
            page: 1,
            limit: 10,
            status: ShiftStatusFilter.scheduled,
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
            status: ShiftStatusFilter.scheduled,
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

        return PaginatedShiftsBloc(
          shiftsService: shiftsService,
          filters: const ShiftFilters(status: ShiftStatusFilter.scheduled),
        );
      },
      act: (PaginatedShiftsBloc bloc) async {
        await bloc.fetchInitial();
        await bloc.loadMoreShifts();
      },
      expect: () => <Matcher>[
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsSuccess<Shift>>(),
        isA<GetItemsLoading<Shift>>().having(
          (GetItemsLoading<Shift> state) => state.response?.data,
          'existing shifts',
          hasLength(1),
        ),
        isA<GetItemsSuccess<Shift>>()
            .having(
              (GetItemsSuccess<Shift> state) => state.response.data,
              'appended shifts',
              hasLength(2),
            )
            .having(
              (GetItemsSuccess<Shift> state) => state.canLoadMore,
              'hasNextPage',
              isFalse,
            ),
      ],
    );

    blocTest<PaginatedShiftsBloc, GetItemsState<Shift>>(
      'fetchInitial emits error when service fails',
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

        return PaginatedShiftsBloc(
          shiftsService: shiftsService,
          filters: const ShiftFilters(),
        );
      },
      act: (PaginatedShiftsBloc bloc) => bloc.fetchInitial(),
      expect: () => <Matcher>[
        isA<GetItemsLoading<Shift>>(),
        isA<GetItemsFailure<Shift>>().having(
          (GetItemsFailure<Shift> state) => state.failure.message,
          'errorMessage',
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
  });

  group('ShiftActionsCubit', () {
    blocTest<ShiftActionsCubit, ShiftActionsState>(
      'emits loading and loaded when cancel succeeds',
      build: () {
        when(
          () => shiftsService.cancelShift('shift-id'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ShiftActionsCubit(shiftsService: shiftsService);
      },
      act: (ShiftActionsCubit cubit) => cubit.cancelShift('shift-id'),
      expect: () => <ShiftActionsState>[
        const ShiftActionsState(
          viewState: ViewState.loading,
          action: ShiftAction.cancel,
        ),
        const ShiftActionsState(
          viewState: ViewState.loaded,
          action: ShiftAction.cancel,
        ),
      ],
    );

    blocTest<ShiftActionsCubit, ShiftActionsState>(
      'emits loading and loaded when clock in succeeds',
      build: () {
        when(
          () => shiftsService.clockIn('shift-id'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ShiftActionsCubit(shiftsService: shiftsService);
      },
      act: (ShiftActionsCubit cubit) => cubit.clockIn('shift-id'),
      expect: () => <ShiftActionsState>[
        const ShiftActionsState(
          viewState: ViewState.loading,
          action: ShiftAction.clockIn,
        ),
        const ShiftActionsState(
          viewState: ViewState.loaded,
          action: ShiftAction.clockIn,
        ),
      ],
    );

    blocTest<ShiftActionsCubit, ShiftActionsState>(
      'verifies location before clock in when location service is available',
      build: () {
        when(() => locationService.currentCoordinates()).thenAnswer(
          (_) async => const Right<AppError, Coordinates>(
            Coordinates(latitude: 51.5074, longitude: -0.1276),
          ),
        );
        when(
          () => shiftsService.verifyLocation(
            id: 'shift-id',
            latitude: 51.5074,
            longitude: -0.1276,
          ),
        ).thenAnswer(
          (_) async => const Right<AppError, LocationVerificationResult>(
            LocationVerificationResult(
              withinRange: true,
              distanceMeters: 45,
              radiusMeters: 200,
            ),
          ),
        );
        when(
          () => shiftsService.clockIn('shift-id'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ShiftActionsCubit(
          shiftsService: shiftsService,
          locationService: locationService,
        );
      },
      act: (ShiftActionsCubit cubit) => cubit.clockIn('shift-id'),
      expect: () => <ShiftActionsState>[
        const ShiftActionsState(
          viewState: ViewState.loading,
          action: ShiftAction.clockIn,
        ),
        const ShiftActionsState(
          viewState: ViewState.loaded,
          action: ShiftAction.clockIn,
        ),
      ],
      verify: (_) {
        verify(() => locationService.currentCoordinates()).called(1);
        verify(
          () => shiftsService.verifyLocation(
            id: 'shift-id',
            latitude: 51.5074,
            longitude: -0.1276,
          ),
        ).called(1);
        verify(() => shiftsService.clockIn('shift-id')).called(1);
      },
    );

    blocTest<ShiftActionsCubit, ShiftActionsState>(
      'does not clock in when server location verification fails',
      build: () {
        when(() => locationService.currentCoordinates()).thenAnswer(
          (_) async => const Right<AppError, Coordinates>(
            Coordinates(latitude: 51.5074, longitude: -0.1276),
          ),
        );
        when(
          () => shiftsService.verifyLocation(
            id: 'shift-id',
            latitude: 51.5074,
            longitude: -0.1276,
          ),
        ).thenAnswer(
          (_) async => const Left<AppError, LocationVerificationResult>(
            AppError('You are not within the required distance'),
          ),
        );
        return ShiftActionsCubit(
          shiftsService: shiftsService,
          locationService: locationService,
        );
      },
      act: (ShiftActionsCubit cubit) => cubit.clockIn('shift-id'),
      expect: () => <ShiftActionsState>[
        const ShiftActionsState(
          viewState: ViewState.loading,
          action: ShiftAction.clockIn,
        ),
        const ShiftActionsState(
          viewState: ViewState.error,
          action: ShiftAction.clockIn,
          errorMessage: 'You are not within the required distance',
        ),
      ],
      verify: (_) {
        verifyNever(() => shiftsService.clockIn('shift-id'));
      },
    );

    blocTest<ShiftActionsCubit, ShiftActionsState>(
      'emits loading and loaded when clock out succeeds',
      build: () {
        when(
          () => shiftsService.clockOut('shift-id'),
        ).thenAnswer((_) async => const Right<AppError, Unit>(unit));
        return ShiftActionsCubit(shiftsService: shiftsService);
      },
      act: (ShiftActionsCubit cubit) => cubit.clockOut('shift-id'),
      expect: () => <ShiftActionsState>[
        const ShiftActionsState(
          viewState: ViewState.loading,
          action: ShiftAction.clockOut,
        ),
        const ShiftActionsState(
          viewState: ViewState.loaded,
          action: ShiftAction.clockOut,
        ),
      ],
    );

    blocTest<ShiftActionsCubit, ShiftActionsState>(
      'emits loading and error when an action fails',
      build: () {
        when(() => shiftsService.clockOut('shift-id')).thenAnswer(
          (_) async => const Left<AppError, Unit>(AppError('Too early')),
        );
        return ShiftActionsCubit(shiftsService: shiftsService);
      },
      act: (ShiftActionsCubit cubit) => cubit.clockOut('shift-id'),
      expect: () => <ShiftActionsState>[
        const ShiftActionsState(
          viewState: ViewState.loading,
          action: ShiftAction.clockOut,
        ),
        const ShiftActionsState(
          viewState: ViewState.error,
          action: ShiftAction.clockOut,
          errorMessage: 'Too early',
        ),
      ],
    );

    blocTest<ShiftActionsCubit, ShiftActionsState>(
      'resets action error message',
      build: () => ShiftActionsCubit(shiftsService: shiftsService),
      seed: () => const ShiftActionsState(
        viewState: ViewState.error,
        action: ShiftAction.clockOut,
        errorMessage: 'Too early',
      ),
      act: (ShiftActionsCubit cubit) => cubit.resetErrorMessage(),
      expect: () => <ShiftActionsState>[
        const ShiftActionsState(action: ShiftAction.clockOut),
      ],
    );
  });
}
