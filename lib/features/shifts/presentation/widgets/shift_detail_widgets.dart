import 'dart:async';

import 'package:orta/features/features.dart';

class ShiftDetailView extends StatelessWidget {
  const ShiftDetailView({super.key, required this.args});

  final ShiftDetailArgs args;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: <BlocListener<dynamic, dynamic>>[
        BlocListener<ShiftDetailCubit, ShiftDetailState>(
          listenWhen: (ShiftDetailState previous, ShiftDetailState current) {
            return previous.shift != current.shift && current.shift != null;
          },
          listener: (BuildContext context, ShiftDetailState state) {
            context.read<ShiftActionEligibilityCubit>().evaluate(state.shift!);
          },
        ),
        BlocListener<ShiftActionsCubit, ShiftActionsState>(
          listener: (BuildContext context, ShiftActionsState state) {
            if (state.isError && state.errorMessage != null) {
              AppSnacks.error(context, state.errorMessage!);
            }

            if (state.isLoaded) {
              AppSnacks.success(context, _actionSuccessMessage(state.action));
              context.read<ShiftDetailCubit>().getShiftDetail(args.shiftId);
            }
          },
        ),
      ],
      child: BlocBuilder<ShiftDetailCubit, ShiftDetailState>(
        builder: (BuildContext context, ShiftDetailState state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: const ShiftDetailAppBar(),
            body: AppLoadingOverlay(
              loading: state.isLoading || state.isInitial,
              child: ShiftDetailBody(state: state),
            ),
            bottomNavigationBar: state.shift == null
                ? null
                : FixedShiftAction(shift: state.shift!),
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

class ShiftDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShiftDetailAppBar({super.key});

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

class ShiftDetailBody extends StatelessWidget {
  const ShiftDetailBody({super.key, required this.state});

  final ShiftDetailState state;

  @override
  Widget build(BuildContext context) {
    if (state.isError && state.shift == null) {
      return _ShiftDetailRetry(errorMessage: state.errorMessage);
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
      child: AppAnimatedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _MapPreview(coordinates: shift.location.coordinates),
          AppSpacings.vertical(25),
          _ShiftTitleRow(shift: shift),
          AppSpacings.vertical(26),
          _ShiftScheduleInfoRow(shift: shift),
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

class FixedShiftAction extends StatelessWidget {
  const FixedShiftAction({super.key, required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        padding: EdgeInsets.fromLTRB(
          16.0.width,
          12.0.height,
          16.0.width,
          10.0.height,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _ShiftActionWarning(shift: shift),
            _ShiftPrimaryAction(shift: shift),
          ],
        ),
      ),
    );
  }
}

class _ShiftDetailRetry extends StatelessWidget {
  const _ShiftDetailRetry({required this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
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
        errorMessage: errorMessage ?? 'Unable to load shift',
      ),
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview({required this.coordinates});

  final Coordinates coordinates;

  @override
  Widget build(BuildContext context) {
    final String imageUrl = GoogleStaticMapUrl.build(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude,
      apiKey: AppConfig.googleMapsApiKey,
    );
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AppNetworkImage(
          imageUrl: imageUrl,
          height: 150.0.height,
          width: double.infinity,
          borderRadius: BorderRadius.circular(2.0.radius),
          errorWidget: const _MapPreviewFallback(),
        ),
        if (imageUrl.isEmpty) const _MapPreviewFallback(),
      ],
    );
  }
}

class _MapPreviewFallback extends StatelessWidget {
  const _MapPreviewFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0.height,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: .35),
        borderRadius: BorderRadius.circular(2.0.radius),
      ),
      child: Icon(
        Icons.location_on,
        color: AppColors.primary,
        size: 34.0.radius,
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

class _ShiftScheduleInfoRow extends StatelessWidget {
  const _ShiftScheduleInfoRow({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    if (shift.status == ShiftStatus.inProgress && shift.clockInTime != null) {
      return _InProgressShiftTimeRow(shift: shift);
    }

    return _DetailInfoRow(
      icon: CupertinoIcons.clock,
      title: DateUtils.twentyFourHourRange(shift.startTime, shift.finishTime),
      subtitle:
          'Arrival Time, ${DateUtils.durationInHours(shift.startTime, shift.finishTime)}',
    );
  }
}

class _InProgressShiftTimeRow extends StatefulWidget {
  const _InProgressShiftTimeRow({required this.shift});

  final Shift shift;

  @override
  State<_InProgressShiftTimeRow> createState() =>
      _InProgressShiftTimeRowState();
}

class _InProgressShiftTimeRowState extends State<_InProgressShiftTimeRow> {
  late DateTime _now = DateTime.now();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _now = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _ShiftTimeProgress progress = _ShiftTimeProgress.fromShift(
      widget.shift,
      now: _now,
    );

    return _DetailInfoRow(
      icon: CupertinoIcons.clock,
      title: progress.elapsedLabel,
      subtitle: progress.remainingLabel,
    );
  }
}

class _ShiftTimeProgress {
  const _ShiftTimeProgress({
    required this.elapsedLabel,
    required this.remainingLabel,
  });

  final String elapsedLabel;
  final String remainingLabel;

  factory _ShiftTimeProgress.fromShift(Shift shift, {required DateTime now}) {
    final DateTime clockInTime = _clockInDateTime(shift) ?? now;
    final Duration elapsed = _positiveDuration(now.difference(clockInTime));
    final DateTime finish = _finishDateTime(shift);
    final Duration remaining = _positiveDuration(finish.difference(now));

    return _ShiftTimeProgress(
      elapsedLabel: _clockDuration(elapsed),
      remainingLabel: _hoursLeft(remaining),
    );
  }

  static DateTime? _clockInDateTime(Shift shift) {
    final DateTime? clockInTime = shift.clockInTime;
    if (clockInTime == null) {
      return null;
    }

    if (clockInTime.year > 1970) {
      return clockInTime;
    }

    return DateTime(
      shift.date.year,
      shift.date.month,
      shift.date.day,
      clockInTime.hour,
      clockInTime.minute,
      clockInTime.second,
    );
  }

  static DateTime _finishDateTime(Shift shift) {
    final DateTime start = DateTime(
      shift.date.year,
      shift.date.month,
      shift.date.day,
      shift.startTime.hour,
      shift.startTime.minute,
      shift.startTime.second,
    );
    final DateTime finish = DateTime(
      shift.date.year,
      shift.date.month,
      shift.date.day,
      shift.finishTime.hour,
      shift.finishTime.minute,
      shift.finishTime.second,
    );

    return finish.isBefore(start)
        ? finish.add(const Duration(days: 1))
        : finish;
  }

  static Duration _positiveDuration(Duration duration) {
    return duration.isNegative ? Duration.zero : duration;
  }

  static String _clockDuration(Duration duration) {
    final int hours = duration.inHours;
    final int minutes = duration.inMinutes.remainder(Duration.minutesPerHour);
    final int seconds = duration.inSeconds.remainder(Duration.secondsPerMinute);

    return '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }

  static String _hoursLeft(Duration duration) {
    if (duration == Duration.zero) {
      return '0 hours Left';
    }

    if (duration.inMinutes < Duration.minutesPerHour) {
      return 'Less than 1 hour Left';
    }

    final int hours = (duration.inMinutes / Duration.minutesPerHour).ceil();
    return '$hours ${hours == 1 ? 'hour' : 'hours'} Left';
  }

  static String _twoDigits(int value) => value.toString().padLeft(2, '0');
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
    return BlocBuilder<
      ShiftActionEligibilityCubit,
      ShiftActionEligibilityState
    >(
      builder: (BuildContext context, ShiftActionEligibilityState state) {
        final _WorkLocationPresentation presentation =
            _WorkLocationPresentation.fromState(state);

        return Row(
          children: <Widget>[
            Icon(
              presentation.icon,
              color: presentation.color,
              size: 30.0.radius,
            ),
            AppSpacings.horizontal(18),
            Expanded(
              child: Text(
                presentation.text,
                style: context.text.titleLarge?.copyWith(
                  color: AppColors.textColor.withValues(alpha: .82),
                  fontSize: 16.0.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _WorkLocationPresentation {
  const _WorkLocationPresentation({
    required this.icon,
    required this.color,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String text;

  factory _WorkLocationPresentation.fromState(
    ShiftActionEligibilityState state,
  ) {
    if (state.isInitial || state.isLoading) {
      return _WorkLocationPresentation(
        icon: CupertinoIcons.location_fill,
        color: AppColors.greyDark,
        text: 'Checking work location',
      );
    }

    if (state.eligibility?.isWithinWorkLocation == true) {
      return _WorkLocationPresentation(
        icon: CupertinoIcons.location_fill,
        color: AppColors.success,
        text: 'You are within work Location',
      );
    }

    return _WorkLocationPresentation(
      icon: Icons.location_off_outlined,
      color: AppColors.alert,
      text: 'You are outside work location',
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

class _ShiftActionWarning extends StatelessWidget {
  const _ShiftActionWarning({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ShiftActionEligibilityCubit,
      ShiftActionEligibilityState
    >(
      builder: (BuildContext context, ShiftActionEligibilityState state) {
        final _ShiftActionWarningPresentation? presentation =
            _ShiftActionWarningPresentation.fromState(state);
        if (presentation == null) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: EdgeInsets.only(bottom: 10.0.height),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.alert,
                size: 18.0.radius,
              ),
              AppSpacings.horizontal(8),
              Expanded(
                child: Text(
                  presentation.message,
                  style: context.text.bodyMedium?.copyWith(
                    color: AppColors.alert,
                    fontSize: 12.0.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              AppSpacings.horizontal(8),
              _ShiftActionWarningButton(
                shift: shift,
                presentation: presentation,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ShiftActionWarningButton extends StatelessWidget {
  const _ShiftActionWarningButton({
    required this.shift,
    required this.presentation,
  });

  final Shift shift;
  final _ShiftActionWarningPresentation presentation;

  @override
  Widget build(BuildContext context) {
    if (presentation.action == ShiftLocationAction.requestPermission) {
      return IconButton(
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: 32.0.width,
          minHeight: 32.0.width,
        ),
        onPressed: () => _onPressed(context),
        icon: Icon(Icons.refresh, color: AppColors.alert, size: 18.0.radius),
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(horizontal: 8.0.width),
        minimumSize: Size(0, 32.0.height),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => _onPressed(context),
      child: Text(
        presentation.buttonLabel,
        style: context.text.bodyMedium?.copyWith(
          color: AppColors.primary,
          fontSize: 12.0.fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    final ShiftActionEligibilityCubit cubit = context
        .read<ShiftActionEligibilityCubit>();

    switch (presentation.action) {
      case ShiftLocationAction.requestPermission:
        cubit.evaluate(shift);
      case ShiftLocationAction.openAppSettings:
        cubit.openAppSettings(shift);
      case ShiftLocationAction.openLocationSettings:
        cubit.openLocationSettings(shift);
    }
  }
}

class _ShiftActionWarningPresentation {
  const _ShiftActionWarningPresentation({
    required this.message,
    required this.buttonLabel,
    required this.action,
  });

  final String message;
  final String buttonLabel;
  final ShiftLocationAction action;

  factory _ShiftActionWarningPresentation.fromEligibility(
    ShiftActionEligibility eligibility,
  ) {
    final ShiftLocationAction action =
        eligibility.locationAction ?? ShiftLocationAction.requestPermission;

    return _ShiftActionWarningPresentation(
      message: eligibility.warningMessage ?? '',
      buttonLabel: _buttonLabel(action),
      action: action,
    );
  }

  static _ShiftActionWarningPresentation? fromState(
    ShiftActionEligibilityState state,
  ) {
    final ShiftActionEligibility? eligibility = state.eligibility;
    final String? warning = eligibility?.warningMessage;
    if (eligibility == null || warning == null || warning.isEmpty) {
      return null;
    }

    return _ShiftActionWarningPresentation.fromEligibility(eligibility);
  }

  static String _buttonLabel(ShiftLocationAction action) {
    return switch (action) {
      ShiftLocationAction.requestPermission => '',
      ShiftLocationAction.openAppSettings => 'Open settings',
      ShiftLocationAction.openLocationSettings => 'Enable',
    };
  }
}

class _ShiftPrimaryAction extends StatelessWidget {
  const _ShiftPrimaryAction({required this.shift});

  final Shift shift;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ShiftActionEligibilityCubit,
      ShiftActionEligibilityState
    >(
      builder:
          (BuildContext context, ShiftActionEligibilityState eligibilityState) {
            return BlocBuilder<ShiftActionsCubit, ShiftActionsState>(
              builder: (BuildContext context, ShiftActionsState actionState) {
                final _ShiftPrimaryActionPresentation presentation =
                    _ShiftPrimaryActionPresentation.fromStates(
                      eligibilityState: eligibilityState,
                      actionState: actionState,
                    );

                return AppButton(
                  color: AppColors.primary,
                  enabled: presentation.enabled,
                  height: 42,
                  borderRadius: BorderRadius.circular(8.0.radius),
                  margin: EdgeInsets.zero,
                  onPressed: () => _onPrimaryActionPressed(
                    context,
                    presentation.eligibility,
                  ),
                  child: Text(
                    presentation.label,
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: 18.0.fontSize,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                );
              },
            );
          },
    );
  }

  void _onPrimaryActionPressed(
    BuildContext context,
    ShiftActionEligibility? eligibility,
  ) {
    if (eligibility == null || !eligibility.enabled) {
      return;
    }

    ShiftDecisionModal.show(
      context: context,
      action: _decisionAction(eligibility.action),
      onConfirmed: () => _runShiftAction(context, eligibility.action),
    );
  }

  ShiftDecisionAction _decisionAction(ShiftPrimaryActionType action) {
    return switch (action) {
      ShiftPrimaryActionType.clockOut => ShiftDecisionAction.clockOut,
      _ => ShiftDecisionAction.clockIn,
    };
  }

  void _runShiftAction(BuildContext context, ShiftPrimaryActionType action) {
    final ShiftActionsCubit cubit = context.read<ShiftActionsCubit>();

    switch (action) {
      case ShiftPrimaryActionType.clockOut:
        cubit.clockOut(shift.id);
      case ShiftPrimaryActionType.clockIn:
        cubit.clockIn(shift.id);
      case ShiftPrimaryActionType.completed:
      case ShiftPrimaryActionType.cancelled:
        break;
    }
  }
}

class _ShiftPrimaryActionPresentation {
  const _ShiftPrimaryActionPresentation({
    required this.label,
    required this.enabled,
    required this.eligibility,
  });

  final String label;
  final bool enabled;
  final ShiftActionEligibility? eligibility;

  factory _ShiftPrimaryActionPresentation.fromStates({
    required ShiftActionEligibilityState eligibilityState,
    required ShiftActionsState actionState,
  }) {
    final bool checkingLocation =
        eligibilityState.isInitial || eligibilityState.isLoading;
    final ShiftActionEligibility? eligibility = eligibilityState.eligibility;

    if (checkingLocation) {
      return const _ShiftPrimaryActionPresentation(
        label: 'Checking Location',
        enabled: false,
        eligibility: null,
      );
    }

    return _ShiftPrimaryActionPresentation(
      label: eligibility?.label ?? 'Clock In',
      enabled: !actionState.isLoading && (eligibility?.enabled ?? false),
      eligibility: eligibility,
    );
  }
}
