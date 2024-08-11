import 'dart:ui' as ui;

import 'package:flutter/animation.dart';
import 'package:flutter_kanjivg/src/extensions/kvg_data_extension.dart';
import 'package:flutter_kanjivg/src/extensions/path_extension.dart';
import 'package:kanjivg/kanjivg.dart';
import 'package:vector_graphics_compiler/vector_graphics_compiler.dart'
    as compiler;

/// A controller for an animation of a kanji.
///
/// [KanjiController] wraps [AnimationController] in order to provide an
/// appropiate drawing animation for loaded characters.
class KanjiController extends AnimationController {
  /// Constructor for an instance of [KanjiController].
  KanjiController({
    required super.vsync,
    super.duration = const Duration(seconds: 5),
  }) : _isPlaying = false;

  /// Currently loaded kanji character.
  KvgData? get data => _data;
  KvgData? _data;

  /// Whether the drawing animation is currently playing.
  bool get isPlaying => _isPlaying;
  bool _isPlaying;

  /// Toggle the current state.
  TickerFuture toggle({ double? from }) {
    if (isCompleted) {
      reset();
      forward();
    } else {
      if (_isPlaying) {
        stop();
      } else {
        forward();
      }
    }
    return TickerFuture.complete();
  }

  /// May throw an exception if you provide invalid `data`.
  void load(KvgData? data) {
    _data = data;

    stop();
    reset();
    notifyListeners();
  }

  @override
  TickerFuture forward({double? from}) {
    final future = super.forward(from: from);
    _isPlaying = true;
    notifyListeners();

    return future;
  }

  /// Draw the character to a specific stroke.
  TickerFuture drawTo(
    int stroke, {
    Duration? duration,
    Curve curve = Curves.linear,
  }) {
    // Early return if there's no character to animate.
    if (_data == null) {
      TickerFuture.complete();
    }

    assert(
      stroke <= _data!.paths.length,
      "Stroke number can't be greater than the number of strokes.",
    );

    final ogPath = _data!.createPath();
    final totalLength = ogPath.computeLength();

    // Length of the new path.
    final newLength = () {
      final path = ui.Path();
      for (var i = 0; i < stroke; i++) {
        final commands = compiler.parseSvgPathData(_data!.paths[i]).commands;
        path.drawCommands(commands);
      }

      // FIXME: This 0.1 is a random number to make it work, but it's not accurate
      // nor the best solution.
      return path.computeLength() - 0.1;
    }();

    return animateTo(
      newLength / totalLength,
      duration: duration,
      curve: curve,
    );
  }

  @override
  TickerFuture reverse({double? from}) {
    final future = super.reverse(from: from);
    _isPlaying = true;
    notifyListeners();

    return future;
  }

  @override
  void stop({bool canceled = true}) {
    _isPlaying = false;
    notifyListeners();

    super.stop(canceled: canceled);
  }
}
