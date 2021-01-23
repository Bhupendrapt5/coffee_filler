import 'dart:ui';

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final double _animation0;
  final double _animation1;
  final double _animation2;
  // final double _animation3;

  RPSCustomPainter(
    this._animation0,
    this._animation1,
    this._animation2,
    // this._animation3,
  );
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 0, 112, 74)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.20, size.height * 0.26);
    path_0.lineTo(size.width * 0.80, size.height * 0.26);
    path_0.lineTo(size.width * 0.68, size.height * 0.80);
    path_0.lineTo(size.width * 0.32, size.height * 0.80);
    path_0.lineTo(size.width * 0.20, size.height * 0.26);
    path_0.close();
    Path _p0 = createAnimatedPath(path_0, _animation0);
    canvas.drawPath(_p0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 0, 112, 74)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.20, size.height * 0.26);
    path_1.quadraticBezierTo(size.width * 0.15, size.height * 0.26,
        size.width * 0.13, size.height * 0.23);
    path_1.quadraticBezierTo(size.width * 0.15, size.height * 0.20,
        size.width * 0.20, size.height * 0.20);
    path_1.lineTo(size.width * 0.80, size.height * 0.20);
    path_1.quadraticBezierTo(size.width * 0.86, size.height * 0.21,
        size.width * 0.87, size.height * 0.23);
    path_1.quadraticBezierTo(size.width * 0.86, size.height * 0.26,
        size.width * 0.80, size.height * 0.26);
    Path _p1 = createAnimatedPath(path_1, _animation1);
    canvas.drawPath(_p1, paint_1);

    Paint paint_2 = new Paint()
      ..color = Color.fromARGB(255, 0, 112, 74)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.48, size.height * 0.20);
    path_2.lineTo(size.width * 0.48, size.height * 0.12);
    path_2.lineTo(size.width * 0.57, size.height * 0.09);
    path_2.lineTo(size.width * 0.59, size.height * 0.10);
    path_2.lineTo(size.width * 0.52, size.height * 0.13);
    path_2.lineTo(size.width * 0.52, size.height * 0.20);
    Path _p2 = createAnimatedPath(path_2, _animation2);
    canvas.drawPath(_p2, paint_2);
    // paint_0 = new Paint()
    //   ..color = Color.fromARGB(255, 111, 78, 55)
    //   ..style = PaintingStyle.fill;
    // Path _p4 = createAnimatedPath(path_0, _animation3);
    // canvas.drawPath(_p4, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    // ComputeMetrics can only be iterated once!
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = new Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
