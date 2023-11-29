import 'package:flutter/animation.dart';
import 'package:kanjivg/kanjivg.dart';

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
  void toggle() {
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
