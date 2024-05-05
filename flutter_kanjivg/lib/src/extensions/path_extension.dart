import 'dart:ui';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart'
    as compiler;

/// Extension methods for the [Path] class.
extension PathExtension on Path {
  /// Draws a command on this path.
  void drawCommand(compiler.PathCommand command) {
    if (command is compiler.LineToCommand) {
      lineTo(command.x, command.y);
    } else if (command is compiler.MoveToCommand) {
      moveTo(command.x, command.y);
    } else if (command is compiler.CubicToCommand) {
      cubicTo(
        command.x1,
        command.y1,
        command.x2,
        command.y2,
        command.x3,
        command.y3,
      );
    }
  }

  /// Draws a collection of commands on this path.
  void drawCommands(Iterable<compiler.PathCommand> commands) =>
      commands.forEach(drawCommand);

  /// Total length of this path.
  double computeLength() => computeMetrics()
      .fold<double>(0, (previous, metric) => previous + metric.length);
}
