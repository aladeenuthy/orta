import 'package:orta/features/features.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  ShiftFilters _filters = const ShiftFilters(sortOrder: ShiftSortOrder.desc);
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<MarketplaceShiftsBloc>(
          create: (_) =>
              locator<MarketplaceShiftsBloc>()
                ..fetchInitial(filters: _filters, searchQuery: _searchQuery),
        ),
        BlocProvider<MarketplaceActionsCubit>(
          create: (_) => locator<MarketplaceActionsCubit>(),
        ),
      ],
      child: BlocConsumer<MarketplaceActionsCubit, MarketplaceActionsState>(
        listener: (BuildContext context, MarketplaceActionsState state) {
          if (state.isError && state.errorMessage != null) {
            AppSnacks.error(context, state.errorMessage!);
          }

          if (state.isLoaded) {
            AppSnacks.success(context, 'Shift claimed!');
            context.read<MarketplaceShiftsBloc>().refresh(
              filters: _filters,
              searchQuery: _searchQuery,
            );
          }
        },
        builder: (BuildContext context, MarketplaceActionsState actionState) {
          return AppLoadingOverlay(
            loading: actionState.isLoading,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: const _MarketplaceAppBar(),
              body: _MarketplaceBody(
                filters: _filters,
                searchQuery: _searchQuery,
                onFiltersChanged: (ShiftFilters filters) {
                  setState(() => _filters = filters);
                  context.read<MarketplaceShiftsBloc>().refresh(
                    filters: filters,
                    searchQuery: _searchQuery,
                  );
                },
                onSearchChanged: (String query) {
                  setState(() => _searchQuery = query);
                  context.read<MarketplaceShiftsBloc>().refresh(
                    filters: _filters,
                    searchQuery: query,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MarketplaceBody extends StatelessWidget {
  const _MarketplaceBody({
    required this.filters,
    required this.searchQuery,
    required this.onFiltersChanged,
    required this.onSearchChanged,
  });

  final ShiftFilters filters;
  final String searchQuery;
  final ValueChanged<ShiftFilters> onFiltersChanged;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0.width, 20.0.height, 16.0.width, 0),
        child: Column(
          children: <Widget>[
            MarketplaceSearchField(
              onChanged: onSearchChanged,
              onFilterTap: () => MarketplaceFilterSheet.show(
                context: context,
                filters: filters,
                onChanged: onFiltersChanged,
              ),
            ),
            AppSpacings.vertical(26),
            _MarketplaceList(filters: filters, searchQuery: searchQuery),
          ],
        ),
      ),
    );
  }
}

class _MarketplaceAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _MarketplaceAppBar();

  @override
  Size get preferredSize => Size.fromHeight(70.0.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 70.0.height,
      title: Text(
        'Shift Market Place',
        style: context.text.headlineMedium?.copyWith(
          color: AppColors.textColor.withValues(alpha: .82),
          fontSize: 20.0.fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _MarketplaceList extends StatelessWidget {
  const _MarketplaceList({required this.filters, required this.searchQuery});

  final ShiftFilters filters;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MarketplaceShiftsBloc, GetItemsState<Shift>>(
        builder: (BuildContext context, GetItemsState<Shift> state) {
          final MarketplaceShiftsBloc bloc = context
              .read<MarketplaceShiftsBloc>();
          final List<Shift> items = bloc.getResolvedItem();

          if (state.isLoading || state.isInitial) {
            return Center(child: AppSpinner(color: AppColors.primary));
          }

          if (state.hasFailure && items.isEmpty) {
            return AppRetryWidget(
              errorMessage:
                  state.failure?.message ?? 'Unable to load marketplace',
              onRetry: () =>
                  bloc.refresh(filters: filters, searchQuery: searchQuery),
            );
          }

          return ListInfiniteScrollView(
            itemCount: items.length,
            onRefresh: () =>
                bloc.refresh(filters: filters, searchQuery: searchQuery),
            onLoadMore: () => bloc.loadMoreShifts(filters: filters),
            headerBuilder: (BuildContext context) => <Widget>[
              _MarketplaceListHeader(filters: filters),
            ],
            itemBuilder: (BuildContext context, int index) {
              return MarketplaceShiftCard(shift: items[index]);
            },
          );
        },
      ),
    );
  }
}

class _MarketplaceListHeader extends StatelessWidget {
  const _MarketplaceListHeader({required this.filters});

  final ShiftFilters filters;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.0.height),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Recent',
                style: context.text.headlineMedium?.copyWith(
                  color: AppColors.textColor,
                  fontSize: 20.0.fontSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Text('Sort by: ', style: context.text.bodyMedium),
            Text(
              filters.sortOrder == ShiftSortOrder.asc ? 'Old' : 'New',
              style: context.text.titleMedium?.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, size: 22.0.radius),
          ],
        ),
      ),
    );
  }
}
