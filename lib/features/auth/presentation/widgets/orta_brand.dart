import 'package:orta/features/features.dart';

class OrtaBrand extends StatelessWidget {
  const OrtaBrand({
    super.key,
    this.iconSize = 32,
    this.fontSize = 18,
    this.centered = false,
    this.text  = 'Orta Shift Manager'
  });

  final double iconSize;
  final double fontSize;
  final bool centered;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Widget brand = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: centered
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: <Widget>[
        _OrtaLogoMark(size: iconSize),
        AppSpacings.horizontal(10),
        Text(
          text,
          style: context.text.titleLarge?.copyWith(
            color: AppColors.primary,
            fontSize: fontSize.fontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

    if (centered) {
      return Center(child: brand);
    }

    return brand;
  }
}

class _OrtaLogoMark extends StatelessWidget {
  const _OrtaLogoMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final double scaledSize = size.width;

    return Container(
      width: scaledSize,
      height: scaledSize,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular((size * .16).radius),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: scaledSize * .26,
            top: scaledSize * .29,
            child: Container(
              width: scaledSize * .48,
              height: scaledSize * .17,
              color: AppColors.white,
            ),
          ),
          Positioned(
            left: scaledSize * .26,
            top: scaledSize * .29,
            child: Container(
              width: scaledSize * .17,
              height: scaledSize * .48,
              color: AppColors.white,
            ),
          ),
          Positioned(
            right: scaledSize * .22,
            bottom: scaledSize * .22,
            child: Container(
              width: scaledSize * .17,
              height: scaledSize * .17,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
