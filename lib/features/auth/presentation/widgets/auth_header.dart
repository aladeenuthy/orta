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
            left: 30.0.width,
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
    final Paint gridPaint = Paint()
      ..color = AppColors.cardGridLine
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;
    final Paint accentPaint = Paint()
      ..color = AppColors.cardGridAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    final double cardWidth = 136.0.width;
    final double cardHeight = 138.0.height;
    final double radius = 18.0.radius;
    final double top = -72.0.height;
    for (int row = 0; row < 2; row++) {
      for (int column = -1; column < 5; column++) {
        final Rect rect = Rect.fromLTWH(
          column * cardWidth,
          top + row * cardHeight,
          cardWidth,
          cardHeight,
        );
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(radius)),
          gridPaint,
        );
      }
    }

    _drawAccentPath(
      canvas,
      paint: accentPaint,
      rect: Rect.fromLTWH(-cardWidth, top, cardWidth, cardHeight),
      radius: radius,
      edges: const <_CardGridEdge>{_CardGridEdge.right, _CardGridEdge.bottom},
    );
    _drawAccentPath(
      canvas,
      paint: accentPaint,
      rect: Rect.fromLTWH(cardWidth * 2, top, cardWidth, cardHeight),
      radius: radius,
      edges: const <_CardGridEdge>{
        _CardGridEdge.left,
        _CardGridEdge.bottom,
        _CardGridEdge.right,
      },
    );
    _drawLowerStepAccent(
      canvas,
      paint: accentPaint,
      top: top,
      cardWidth: cardWidth,
      cardHeight: cardHeight,
      radius: radius,
    );
    _drawAccentPath(
      canvas,
      paint: accentPaint,
      rect: Rect.fromLTWH(
        cardWidth * 4,
        top + cardHeight,
        cardWidth,
        cardHeight,
      ),
      radius: radius,
      edges: const <_CardGridEdge>{_CardGridEdge.left, _CardGridEdge.top},
    );
  }

  void _drawAccentPath(
    Canvas canvas, {
    required Paint paint,
    required Rect rect,
    required double radius,
    required Set<_CardGridEdge> edges,
  }) {
    final Path path = Path();

    if (edges.contains(_CardGridEdge.top)) {
      path.moveTo(rect.left + radius, rect.top);
      path.lineTo(rect.right - radius, rect.top);
    }

    if (edges.contains(_CardGridEdge.right)) {
      path.moveTo(rect.right, rect.top + radius);
      path.lineTo(rect.right, rect.bottom - radius);
    }

    if (edges.contains(_CardGridEdge.bottom)) {
      path.moveTo(rect.right - radius, rect.bottom);
      path.lineTo(rect.left + radius, rect.bottom);
    }

    if (edges.contains(_CardGridEdge.left)) {
      path.moveTo(rect.left, rect.bottom - radius);
      path.lineTo(rect.left, rect.top + radius);
    }

    if (edges.contains(_CardGridEdge.top) &&
        edges.contains(_CardGridEdge.right)) {
      path.moveTo(rect.right - radius, rect.top);
      path.quadraticBezierTo(
        rect.right,
        rect.top,
        rect.right,
        rect.top + radius,
      );
    }

    if (edges.contains(_CardGridEdge.right) &&
        edges.contains(_CardGridEdge.bottom)) {
      path.moveTo(rect.right, rect.bottom - radius);
      path.quadraticBezierTo(
        rect.right,
        rect.bottom,
        rect.right - radius,
        rect.bottom,
      );
    }

    if (edges.contains(_CardGridEdge.bottom) &&
        edges.contains(_CardGridEdge.left)) {
      path.moveTo(rect.left + radius, rect.bottom);
      path.quadraticBezierTo(
        rect.left,
        rect.bottom,
        rect.left,
        rect.bottom - radius,
      );
    }

    if (edges.contains(_CardGridEdge.left) &&
        edges.contains(_CardGridEdge.top)) {
      path.moveTo(rect.left, rect.top + radius);
      path.quadraticBezierTo(rect.left, rect.top, rect.left + radius, rect.top);
    }

    canvas.drawPath(path, paint);
  }

  void _drawLowerStepAccent(
    Canvas canvas, {
    required Paint paint,
    required double top,
    required double cardWidth,
    required double cardHeight,
    required double radius,
  }) {
    final double stepX = cardWidth * 2;
    final double upperY = top + cardHeight;
    final double lowerY = top + (cardHeight * 2);
    final Path path = Path()
      ..moveTo(cardWidth + radius, lowerY)
      ..lineTo(stepX - radius, lowerY)
      ..quadraticBezierTo(stepX, lowerY, stepX, lowerY - radius)
      ..lineTo(stepX, upperY + radius)
      ..quadraticBezierTo(stepX, upperY, stepX + radius, upperY)
      ..lineTo((cardWidth * 3) - radius, upperY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

enum _CardGridEdge { top, right, bottom, left }
