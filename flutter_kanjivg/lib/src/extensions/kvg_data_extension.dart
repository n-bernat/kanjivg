import 'dart:ui' as ui;

import 'package:kanjivg/kanjivg.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart'
    as compiler;

/// Extension methods for the [KvgData] class.
extension KvgDataExtension on KvgData {
  /// Creates a [ui.Path] object from the paths of this [KvgData] instance.
  ui.Path createPath() {
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
}
