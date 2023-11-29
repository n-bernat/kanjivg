/// [KvgRadicalData] contains data about a particular radical in a kanji.
class KvgRadicalData {
  /// Constructor for an instance of [KvgRadicalData].
  const KvgRadicalData({
    required this.id,
    required this.element,
    required this.original,
    required this.position,
    required this.type,
  });

  /// The KanjiVG identification number for this radical.
  final String id;

  /// Radical that is present in a character (e.g. 亻).
  final String element;

  /// Original form of an element (e.g. 人 for 亻).
  final String original;

  /// Position of a radical.
  final KvgRadicalPosition position;

  /// Source of the information about this radical.
  final KvgRadicalType type;
}

/// Position of this radical.
enum KvgRadicalPosition {
  /// This part is under another part.
  bottom,

  /// This part is wrapped around another part, such as 門.
  /// This is used very inconsistently in KanjiVG as a grab-bag for various different structures.
  kamae,

  /// This part is left of another part.
  left,

  /// This part is left and under another part, such as 辶.
  nyo,

  /// This part is the complement or counterpart of a nyo part.
  nyoc,

  /// This part is right of another part.
  right,

  /// This part is left and above another part, such as 广.
  tare,

  /// This part is the complement or counterpart of a tare part.
  tarec,

  /// This part is above another part.
  top,

  /// This part doesn't specify a position.
  unknown,
}

/// Source of the information about this radical.
enum KvgRadicalType {
  /// The generally accepted radical which authors agree on.
  general,

  /// Marks the radicals used by JIS Kanji Jiten, used by Kanjidic,
  /// which sometimes differ from the general or tradit radicals.
  /// This value was added to deal with inconsistencies between
  /// KanjiVG and Kanjidic and other references.
  jis,

  /// Used for Nelson radicals.
  nelson,

  /// Used for the "traditional" radical, where the Kangxi radical disagrees with Nelson.
  tradit,

  /// Used for radicals that are not a part of any group.
  unknown,
}
