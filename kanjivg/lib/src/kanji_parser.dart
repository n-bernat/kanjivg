import 'package:collection/collection.dart';
import 'package:kanjivg/src/models/kvg_data.dart';
import 'package:kanjivg/src/models/kvg_radical_data.dart';
import 'package:xml/xml.dart';

/// [KanjiParser] allows parsing SVG files from the KanjiVG project.
class KanjiParser {
  /// Constructor for an instance of [KanjiParser].
  const KanjiParser();

  /// Parse [source] as [KvgData] and return its value.
  ///
  /// The [source] must be a valid SVG (XML) that is a part of the
  /// dataset from the KanjiVG project.
  ///
  /// If the [source] string does not contain a valid data,
  /// an exeption may be thrown.
  ///
  /// Example:
  /// ```dart
  /// const parser = KanjiParser();
  /// final data = parser.parse(source);
  /// ```
  KvgData parse(String source) {
    const elementKey = 'kvg:element';

    final document = XmlDocument.parse(source);
    final rootNode = document.findAllElements('g').firstWhere(
          (e) => e.attributes.any((f) => f.qualifiedName == elementKey),
        );

    final id = rootNode.attributes
        .firstWhereOrNull((e) => e.name.qualified == 'id')
        ?.value;

    final character = rootNode.attributes
        .firstWhereOrNull((e) => e.name.qualified == elementKey)
        ?.value;

    final radicals = rootNode
        .findAllElements('g')
        .map(
          (node) {
            String? getValue(String name) => node.attributes
                .firstWhereOrNull((e) => e.name.qualified == name)
                ?.value;

            final element = getValue('kvg:element');
            final original = getValue('kvg:original');
            final position = getValue('kvg:position');
            final radical = getValue('kvg:radical');

            if (element == null) {
              return null;
            }

            return KvgRadicalData(
              id: getValue('id') ?? '',
              element: element,
              original: original ?? element,
              position: KvgRadicalPosition.values.firstWhere(
                (element) => element.name == position,
                orElse: () => KvgRadicalPosition.unknown,
              ),
              type: KvgRadicalType.values.firstWhere(
                (element) => element.name == radical,
                orElse: () => KvgRadicalType.unknown,
              ),
            );
          },
        )
        .where((element) => element != null)
        .map((e) => e!)
        .toList();

    final paths = document
        .findAllElements('path')
        .map(
          (e) => e.attributes
              .where((attribute) => attribute.name.local == 'd')
              .first
              .value,
        )
        .toList();

    return KvgData(
      id: id ?? '',
      character: character ?? '',
      radicals: radicals,
      paths: paths,
    );
  }
}
