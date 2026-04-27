import 'package:orta/features/features.dart';

class ShiftDetailScreen extends StatelessWidget {
  const ShiftDetailScreen({super.key, required this.args});

  final ShiftDetailArgs args;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ShiftDetailCubit>(
          create: (_) =>
              locator<ShiftDetailCubit>()..getShiftDetail(args.shiftId),
        ),
        BlocProvider<ShiftActionsCubit>(
          create: (_) => locator<ShiftActionsCubit>(),
        ),
      ],
      child: const _ShiftDetailView(),
    );
  }
}

class _ShiftDetailView extends StatelessWidget {
  const _ShiftDetailView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShiftActionsCubit, ShiftActionsState>(
      listener: (BuildContext context, ShiftActionsState state) {
        if (state.isError && state.errorMessage != null) {
          AppSnacks.error(context, state.errorMessage!);
        }

        if (state.isLoaded) {
          AppSnacks.success(context, _actionSuccessMessage(state.action));
        }
      },
      child: BlocBuilder<ShiftDetailCubit, ShiftDetailState>(
        builder: (BuildContext context, ShiftDetailState state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: const _ShiftDetailAppBar(),
            body: AppLoadingOverlay(
              loading: state.isLoading || state.isInitial,
              child: _ShiftDetailBody(state: state),
            ),
            bottomNavigationBar: state.shift == null
                ? null
                : _FixedShiftAction(shift: state.shift!),
          );
        },
      ),
    );
  }

  String _actionSuccessMessage(ShiftAction? action) {
    return switch (action) {
      ShiftAction.clockIn => 'Clocked in successfully',
      ShiftAction.clockOut => 'Clocked out successfully',
      ShiftAction.cancel => 'Shift cancelled',
      null => 'Shift updated',
    };
  }
}

class _ShiftDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _ShiftDetailAppBar();

  @override
  Size get preferredSize => Size.fromHeight(70.0.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.orange,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 70.0.height,
      leading: Center(
        child: GestureDetector(
          onTap: AppRouter.back,
          child: Container(
            width: 42.0.width,
            height: 42.0.width,
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: .95),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textColor,
              size: 22.0.radius,
            ),
          ),
        ),
      ),
      title: Text(
        'Shift details',
        style: context.text.headlineMedium?.copyWith(
          color: AppColors.white,
          fontSize: 20.0.fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ShiftDetailBody extends StatelessWidget {
  const _ShiftDetailBody({required this.state});

  final ShiftDetailState state;

  @override
  Widget build(BuildContext context) {
    if (state.isError && state.shift == null) {
      return Padding(
        padding: AppPaddings.body,
        child: AppRetryWidget(
          onRetry: () {
            final ShiftDetailArgs? args =
                ModalRoute.of(context)?.settings.arguments as ShiftDetailArgs?;
            if (args != null) {
              context.read<ShiftDetailCubit>().getShiftDetail(args.shiftId);
            }
          },
          errorMessage: state.errorMessage ?? 'Unable to load shift',
        ),
      );
    }

    final Shift? shift = state.shift;
    if (shift == null) {
      return const SizedBox.shrink();
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        16.0.width,
        29.0.height,
        16.0.width,
        24.0.height,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const _MapPreview(),
          AppSpacings.vertical(25),
          _ShiftTitleRow(shift: shift),
          AppSpacings.vertical(26),
          _DetailInfoRow(
            icon: CupertinoIcons.clock,
            title:
                '${_ShiftDetailTimeFormatter.twentyFourHour(shift.startTime)}-${_ShiftDetailTimeFormatter.twentyFourHour(shift.finishTime)}',
            subtitle: 'Arrival Time, 4.5 hours',
          ),
          AppSpacings.vertical(22),
          const _DetailInfoRow(
            avatar: _SupervisorAvatar(),
            title: 'Mrs Janet Jones',
            subtitle: 'Supervisor',
          ),
          AppSpacings.vertical(22),
          _DetailInfoRow(
            icon: Icons.location_on_outlined,
            title: shift.location.address ?? shift.location.name,
            subtitle: shift.location.postCode ?? '',
          ),
          AppSpacings.vertical(24),
          const _DashedDivider(),
          AppSpacings.vertical(10),
          const _WorkLocationStatus(),
          AppSpacings.vertical(10),
          const _DashedDivider(),
          AppSpacings.vertical(30),
          const _ShiftEssentials(),
        ],
      ),
    );
  }
}

class _ShiftDetailTimeFormatter {
  const _ShiftDetailTimeFormatter._();

  static String twentyFourHour(DateTime time) {
    final String hour = time.hour.toString().padLeft(2, '0');
    final String minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(2.0.radius),
      ),
    );
  }
}

class _ShiftTitleRow extends StatelessWidget {
  const _ShiftTitleRow({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        LocationMark(),
        AppSpacings.horizontal(10),
        Expanded(
          child: Text(
            shift.location.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.text.titleLarge?.copyWith(
              color: AppColors.textColor.withValues(alpha: .86),
              fontSize: 16.0.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ShiftStatusChip(status: shift.status),
      ],
    );
  }
}

class _DetailInfoRow extends StatelessWidget {
  const _DetailInfoRow({
    required this.title,
    required this.subtitle,
    this.icon,
    this.avatar,
  });

  final IconData? icon;
  final Widget? avatar;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 38.0.width,
          child:
              avatar ??
              Icon(icon, color: AppColors.greyDark, size: 28.0.radius),
        ),
        AppSpacings.horizontal(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.titleMedium?.copyWith(
                  color: AppColors.textColor,
                  fontSize: 14.0.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppSpacings.vertical(8),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodyLarge?.copyWith(
                  color: AppColors.greyDark,
                  fontSize: 12.0.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SupervisorAvatar extends StatelessWidget {
  const _SupervisorAvatar();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 13.0.radius,
      backgroundColor: HexColor.fromHex('#E954A4'),
      child: Icon(Icons.person, color: AppColors.textColor, size: 18.0.radius),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0.height,
      width: double.infinity,
      child: CustomPaint(
        painter: _DashedDividerPainter(
          color: AppColors.greyDark.withValues(alpha: .5),
        ),
      ),
    );
  }
}

class _DashedDividerPainter extends CustomPainter {
  const _DashedDividerPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    const double dashWidth = 6;
    const double gap = 6;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedDividerPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _WorkLocationStatus extends StatelessWidget {
  const _WorkLocationStatus();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          CupertinoIcons.location_fill,
          color: AppColors.success,
          size: 30.0.radius,
        ),
        AppSpacings.horizontal(18),
        Expanded(
          child: Text(
            'You are within work Location',
            style: context.text.titleLarge?.copyWith(
              color: AppColors.textColor.withValues(alpha: .82),
              fontSize: 16.0.fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _ShiftEssentials extends StatelessWidget {
  const _ShiftEssentials();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Shift Essential',
          style: context.text.titleLarge?.copyWith(
            color: AppColors.alert,
            fontSize: 16.0.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSpacings.vertical(10),
        Text(
          'Safety boots required',
          style: context.text.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12.0.fontSize,
          ),
        ),
        AppSpacings.vertical(8),
        Text(
          'Maintain distance of 2 meters from customers at all times',
          style: context.text.bodyLarge?.copyWith(
            color: AppColors.textSecondary,
            fontSize: 12.0.fontSize,
          ),
        ),
      ],
    );
  }
}

class _FixedShiftAction extends StatelessWidget {
  const _FixedShiftAction({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.fromLTRB(
          16.0.width,
          12.0.height,
          16.0.width,
          10.0.height,
        ),
        child: _ShiftPrimaryAction(shift: shift),
      ),
    );
  }
}

class _ShiftPrimaryAction extends StatelessWidget {
  const _ShiftPrimaryAction({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    final bool isInProgress = shift.status == ShiftStatus.inProgress;
    final String label = isInProgress ? 'Clock Out' : 'Clock In';
    final String shiftId = shift.id;

    return BlocBuilder<ShiftActionsCubit, ShiftActionsState>(
      builder: (BuildContext context, ShiftActionsState state) {
        return AppButton(
          color: AppColors.primary,
          enabled:!state.isLoading,
          height: 42,
          borderRadius: BorderRadius.circular(8.0.radius),
          margin: EdgeInsets.zero,
          onPressed:() {
                  if (isInProgress) {
                    context.read<ShiftActionsCubit>().clockOut(shiftId);
                    return;
                  }
                  context.read<ShiftActionsCubit>().clockIn(shiftId);
                },
          child: Text(
            label,
            style: context.text.titleMedium?.copyWith(
              color: AppColors.white,
              fontSize: 18.0.fontSize,
              fontWeight: FontWeight.w800,
            ),
          ),
        );
      },
    );
  }
}
