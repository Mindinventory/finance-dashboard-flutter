part of charts;

/// Creates the segments for area series.
///
/// This generates the area series points and has the [calculateSegmentPoints] override method
/// used to customize the area series segment point calculation.
///
/// It gets the path, stroke color and fill color from the `series` to render the segment.
///
class AreaSegment extends ChartSegment {
  late Path _path;
  Path? _strokePath;
  Rect? _pathRect;

  /// Gets the color of the series.
  @override
  Paint getFillPaint() {
    fillPaint = Paint();
    if (_series.gradient == null) {
      if (_color != null) {
        fillPaint!.color = _color!;
        fillPaint!.style = PaintingStyle.fill;
      }
    } else {
      fillPaint = (_pathRect != null)
          ? _getLinearGradientPaint(_series.gradient!, _pathRect!,
              _seriesRenderer._chartState!._requireInvertedAxis)
          : fillPaint;
    }
    assert(_series.opacity >= 0,
        'The opacity value of the area series should be greater than or equal to 0.');
    assert(_series.opacity <= 1,
        'The opacity value of the area series should be less than or equal to 1.');
    fillPaint!.color =
        (_series.opacity < 1 && fillPaint!.color != Colors.transparent)
            ? fillPaint!.color.withOpacity(_series.opacity)
            : fillPaint!.color;
    _defaultFillColor = fillPaint;
    return fillPaint!;
  }

  /// Gets the border color of the series.
  @override
  Paint getStrokePaint() {
    final Paint _strokePaint = Paint();
    _strokePaint
      ..style = PaintingStyle.stroke
      ..strokeWidth = _series.borderWidth;
    if (_series.borderGradient != null) {
      _strokePaint.shader =
          _series.borderGradient!.createShader(_strokePath!.getBounds());
    } else if (_strokeColor != null) {
      _strokePaint.color = _series.borderColor;
    }
    _series.borderWidth == 0
        ? _strokePaint.color = Colors.transparent
        : _strokePaint.color;
    _strokePaint.strokeCap = StrokeCap.round;
    _defaultStrokeColor = _strokePaint;
    return _strokePaint;
  }

  /// Calculates the rendering bounds of a segment.
  @override
  void calculateSegmentPoints() {}

  /// Draws segment in series bounds.
  @override
  void onPaint(Canvas canvas) {
    _pathRect = _path.getBounds();
    canvas.drawPath(
        _path, (_series.gradient == null) ? fillPaint! : getFillPaint());
    if (strokePaint!.color != Colors.transparent && _strokePath != null) {
      _drawDashedLine(canvas, _series.dashArray, strokePaint!, _strokePath!);
    }
  }
}
