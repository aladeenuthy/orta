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
        BlocProvider<ShiftActionEligibilityCubit>(
          create: (_) => locator<ShiftActionEligibilityCubit>(),
        ),
      ],
      child: ShiftDetailView(args: args),
    );
  }
}
