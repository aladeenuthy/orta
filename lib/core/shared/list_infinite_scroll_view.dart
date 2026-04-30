// ignore_for_file: long-method, avoid-returning-widgets

import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../../features/features.dart';
import 'app_refresh_indicator.dart';

class ListInfiniteScrollView extends StatefulWidget {
  const ListInfiniteScrollView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.controller,
    required this.onLoadMore,
    this.onRefresh,
    this.headerBuilder,
    this.footerBuilder,
    this.primary,
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.findChildIndexCallback,
    this.parentIsSilver = false,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final List<Widget>? Function(BuildContext)? headerBuilder;
  final List<Widget>? Function(BuildContext)? footerBuilder;
  final ScrollController? controller;
  final AsyncCallback onLoadMore;
  final Future<void> Function()? onRefresh;
  final bool? primary;
  final Axis scrollDirection;
  final EdgeInsetsGeometry? padding;
  final ChildIndexGetter? findChildIndexCallback;
  final bool parentIsSilver;

  @override
  State<ListInfiniteScrollView> createState() => _ListInfiniteScrollViewState();
}

class _ListInfiniteScrollViewState extends State<ListInfiniteScrollView> {
  ValueNotifier<bool> isLoadingVN = ValueNotifier<bool>(false);
  ValueNotifier<bool> errorLoadingVN = ValueNotifier<bool>(false);
  late final ScrollController controller;

  @override
  void initState() {
    controller = widget.controller ?? ScrollController();
    controller.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(scrollListener);
    super.dispose();
  }

  Future<void> scrollListener() async {
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 100) {
      if (!errorLoadingVN.value && !isLoadingVN.value) {
        await _onLoadMore();
      }
    }
  }

  Future<void> _onLoadMore() async {
    try {
      if (isLoadingVN.value) {
        return;
      }

      errorLoadingVN.value = false;
      isLoadingVN.value = true;

      await widget.onLoadMore();

      isLoadingVN.value = false;
    } catch (err) {
      log(err.toString(), name: 'ListInfiniteScrollView');
      isLoadingVN.value = false;
      errorLoadingVN.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> slivers = <Widget>[
      if (widget.scrollDirection == Axis.vertical)
        AppRefreshIndicator(
          marginTop: 10,
          onRefresh: () async {
            await widget.onRefresh?.call();
            errorLoadingVN.value = false;
            isLoadingVN.value = false;
          },
        ),
      if (widget.headerBuilder != null) ...widget.headerBuilder!(context)!,
      SliverPadding(
        padding: widget.padding ?? EdgeInsets.zero,
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            widget.itemBuilder,
            childCount: widget.itemCount,
            findChildIndexCallback: widget.findChildIndexCallback,
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: ValueListenableBuilder<bool>(
          valueListenable: errorLoadingVN,
          builder: (BuildContext context, bool errorLoading, _) {
            if (errorLoading) {
              return InkWell(
                onTap: () async {
                  await _onLoadMore();
                },
                child: Column(
                  children: <Widget>[
                    AppSpacings.vertical(30),
                    Text(
                      'Error loading more items',
                      textAlign: TextAlign.center,
                      style: context.text.bodySmall?.copyWith(
                        color: AppColors.error,
                        fontSize: 12,
                      ),
                    ),
                    AppSpacings.vertical(10),
                    const Text(
                      'Retry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                    AppSpacings.vertical(30),
                  ],
                ),
              );
            }
            return ValueListenableBuilder<bool>(
              valueListenable: isLoadingVN,
              builder: (BuildContext context, bool isLoading, _) {
                if (isLoading) {
                  return widget.scrollDirection == Axis.vertical
                      ? AppSpinner(size: 25, color: AppColors.primary)
                      : Center(
                          child: AppSpinner(size: 25, color: AppColors.primary),
                        );
                }
                return const SizedBox();
              },
            );
          },
        ),
      ),
      if (widget.footerBuilder != null) ...widget.footerBuilder!(context)!,
    ];

    if (widget.parentIsSilver) {
      return SliverMainAxisGroup(slivers: slivers);
    }

    return CustomScrollView(
      controller: (widget.controller != null && widget.primary == false)
          ? null
          : controller,
      primary: widget.primary,
      scrollDirection: widget.scrollDirection,
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      slivers: slivers,
    );
  }
}
