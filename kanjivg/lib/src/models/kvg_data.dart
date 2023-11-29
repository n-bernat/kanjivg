import 'package:kanjivg/src/models/kvg_radical_data.dart';

/// [KvgData] contains all the data that we can get from a particular SVG file.
class KvgData {
  /// Constructor for an instance of [KvgData].
  const KvgData({
    required this.id,
    required this.character,
    required this.radicals,
    required this.paths,
  });

  /// The KanjiVG identification number for this character.
  final String id;

  /// Kanji character described by this instance.
  final String character;

  /// Radicals that this character consists of.
  /// May be empty in case this character is a primary racical (e.g. 一).
  final List<KvgRadicalData> radicals;

  /// Paths that can be used to draw this character.
  final List<String> paths;

  /// The number of strokes in this character.
  int get strokes => paths.length;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KvgData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          character == other.character &&
          radicals == other.radicals &&
          paths == other.paths;

  @override
  int get hashCode => Object.hash(id, character, radicals, paths);
}
