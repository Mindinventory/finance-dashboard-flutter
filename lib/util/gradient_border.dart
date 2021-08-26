import 'package:flutter/material.dart';

class GradientPainter extends CustomPainter {
  GradientPainter(
      {required this.gradient,
      required this.strokeWidth,
      required this.borderRadius});

  final Gradient gradient;
  final double strokeWidth;
  final double borderRadius;
  final Paint paintObject = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    var innerRect = Rect.fromLTRB(strokeWidth, strokeWidth,
        size.width - strokeWidth, size.height - strokeWidth);
    var innerRoundedRect =
        RRect.fromRectAndRadius(innerRect, Radius.circular(borderRadius));
    var outerRect = Offset.zero & size;
    var outerRoundedRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(borderRadius));
    paintObject.shader = gradient.createShader(outerRect);
    var borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);
    canvas.drawPath(borderPath, paintObject);
  }

  Path _calculateBorderPath(RRect outerRRect, RRect innerRRect) {
    var outerRectPath = Path()..addRRect(outerRRect);
    var innerRectPath = Path()..addRRect(innerRRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class GradientBorderContainer extends StatelessWidget {
  GradientBorderContainer(
      {required gradient,
      required this.child,
      required this.onPressed,
      this.strokeWidth = 4,
      this.borderRadius = 64,
      this.padding = 16})
      : painter = GradientPainter(
            gradient: gradient,
            strokeWidth: strokeWidth,
            borderRadius: borderRadius);
  final GradientPainter painter;
  final Widget child;
  final VoidCallback onPressed;
  final double strokeWidth;
  final double borderRadius;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: painter,
        child: Container(padding: EdgeInsets.all(padding), child: child));
  }
}
