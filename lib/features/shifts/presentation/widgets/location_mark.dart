import '../../../features.dart';

class LocationMark extends StatelessWidget {
  const LocationMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'adyen',
      style: context.text.titleMedium?.copyWith(
        color: AppColors.brandGreen,
        fontSize: 17.0.fontSize,
        fontWeight: FontWeight.w900,
        height: 1,
      ),
    );
  }
}
