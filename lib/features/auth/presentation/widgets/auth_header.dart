import 'package:flutter/cupertino.dart';
import 'package:orta/features/features.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    this.showBackButton = false,
    this.onBackPressed,
  });

  final bool showBackButton;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238.0.height,
      width: double.infinity,

      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned.fill(child: CustomPaint(painter: _CardGridPainter())),
          Positioned(
            left: 39.0.width,
            right: 24.0.width,
            bottom: 60.0.height,
            child: const OrtaBrand(iconSize: 31, fontSize: 20),
          ),
          if (showBackButton)
            Positioned(
              left: 4.0.width,
              top: 58.0.height,
              child: CupertinoNavigationBarBackButton(
                color: AppColors.primary,
                onPressed: onBackPressed ?? AppRouter.back,
              ),
            ),
        ],
      ),
    );
  }
}

class _CardGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.cardGridLine
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;

    final double cardWidth = 136.0.width;
    final double cardHeight = 138.0.height;
    final double radius = 18.0.radius;
    final double top = -72.0.height;

    for (int row = 0; row < 2; row++) {
      for (int column = -1; column < 4; column++) {
        final Rect rect = Rect.fromLTWH(
          column * cardWidth,
          top + row * cardHeight,
          cardWidth,
          cardHeight,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(radius)),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
