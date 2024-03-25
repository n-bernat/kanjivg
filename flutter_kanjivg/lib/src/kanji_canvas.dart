import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_kanjivg/src/kanji_controller.dart';
import 'package:kanjivg/kanjivg.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart'
    as compiler;

/// A widget that provides a canvas on which to draw a kanji character.
///
/// See also:
///
///  * [KanjiController], the controller that manages this canvas.
///  * [KanjiParser], the class that allows parsing SVG files from the KanjiVG project.
class KanjiCanvas extends StatelessWidget {
  /// Constructor for an instance of [KanjiCanvas].
  const KanjiCanvas({
    super.key,
    required this.controller,
    this.size,
    this.thickness = 4.0,
    this.color = const Color(0xFF000000),
    this.hintColor,
  });

  /// An object that can be used to control the state of the current drawing animation.
  ///
  /// Must not be `null`.
  final KanjiController controller;

  /// Size of the area that this canvas will take.
  /// It's always a square.
  final double? size;

  /// Thickness of lines in a drawn character.
  final double thickness;

  /// Primary color of the character (black by default).
  /// Will be animated by [KanjiController].
  final Color color;

  /// Hint character that is displayed behind the main one.
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _KanjiPainter(
          controller: controller,
          color: color,
          thickness: thickness,
          hintColor: hintColor,
        ),
      ),
    );
  }
}

class _KanjiPainter extends CustomPainter {
  const _KanjiPainter({
    required this.controller,
    required this.thickness,
    required this.color,
    required this.hintColor,
  }) : super(repaint: controller);

  final KanjiController controller;
  final double thickness;
  final Color color;
  final Color? hintColor;

  ui.Path? createPath() {
    final paths = controller.data?.paths;
    if (paths == null) {
      return null;
    }

    final path = ui.Path();
    for (final data in paths) {
      final pathData = compiler.parseSvgPathData(data);
      for (final command in pathData.commands) {
        if (command is compiler.LineToCommand) {
          path.lineTo(command.x, command.y);
        } else if (command is compiler.MoveToCommand) {
          path.moveTo(command.x, command.y);
        } else if (command is compiler.CubicToCommand) {
          path.cubicTo(
            command.x1,
            command.y1,
            command.x2,
            command.y2,
            command.x3,
            command.y3,
          );
        }
      }
    }

    return path;
  }

  Path createAnimatedPath(Path path, double progress) {
    final totalLength = path
        .computeMetrics()
        .fold<double>(0, (previous, metric) => previous + metric.length);

    final currentLength = totalLength * progress;

    return extractPathUntilLength(path, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    final path = Path();
    final metricsIterator = originalPath.computeMetrics().iterator;

    var currentLength = 0.0;

    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;
      final nextLength = currentLength + metric.length;
      if (nextLength > length) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Bind kanji data to a variable.
    final data = controller.data;
    if (data == null) {
      return;
    }

    // Create a path based on SVG paths.
    final basePath = createPath();
    if (basePath == null) {
      return;
    }

    // Initialize Paint with custom settings.
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = thickness;

    // 109x109 is a constant size from KanjiVG project.
    const bounds = Rect.fromLTRB(0, 0, 109, 109);

    // Scale path to make it match CustomPaint widget.
    final matrix4 = Matrix4.identity()
      ..scale(
        size.width / bounds.width,
        size.height / bounds.height,
      );

    // Limit the path to match the current animation state.
    final path = createAnimatedPath(
      basePath.transform(matrix4.storage),
      controller.value,
    );

    // Draw optional hint behind a character.
    if (hintColor != null) {
      final paint = Paint()
        ..color = hintColor!
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..strokeWidth = thickness;

      canvas.drawPath(basePath.transform(matrix4.storage), paint);
    }

    // Draw it on a canvas.
    if (controller.value != 0) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_KanjiPainter oldDelegate) =>
      controller != oldDelegate.controller ||
      thickness != oldDelegate.thickness ||
      color != oldDelegate.color ||
      hintColor != oldDelegate.hintColor;
}
