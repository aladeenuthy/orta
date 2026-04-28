part of 'marketplace_actions_cubit.dart';

@freezed
class MarketplaceActionsState with _$MarketplaceActionsState {
  const factory MarketplaceActionsState({
    @Default(ViewState.initial) ViewState viewState,
    Shift? claimedShift,
    String? errorMessage,
  }) = _MarketplaceActionsState;

  const MarketplaceActionsState._();

  bool get isLoading => viewState == ViewState.loading;
  bool get isLoaded => viewState == ViewState.loaded;
  bool get isError => viewState == ViewState.error;

  MarketplaceActionsState toLoading() => copyWith(
    viewState: ViewState.loading,
    errorMessage: null,
    claimedShift: null,
  );

  MarketplaceActionsState toLoaded(Shift shift) => copyWith(
    viewState: ViewState.loaded,
    claimedShift: shift,
    errorMessage: null,
  );

  MarketplaceActionsState toError(String message) => copyWith(
    viewState: ViewState.error,
    errorMessage: message,
    claimedShift: null,
  );
}
