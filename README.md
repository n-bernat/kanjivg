# KanjiVG for Flutter & Dart

[![Publisher](https://img.shields.io/pub/publisher/kanjivg.svg)](https://pub.dev/packages/kanjivg/publisher)
[![MIT License](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

| `kanjivg`                                                                                                                                                                       | `flutter_kanjivg`                                                                                                                                                                             |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [![Package](https://img.shields.io/pub/v/kanjivg.svg)](https://pub.dev/packages/kanjivg)                                                                                        | [![Package](https://img.shields.io/pub/v/kanjivg.svg)](https://pub.dev/packages/flutter_kanjivg)                                                                                              |
| [![kanjivg - Checks](https://github.com/n-bernat/kanjivg/actions/workflows/dart_checks.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/dart_checks.yaml) | [![flutter_kanjivg - Checks](https://github.com/n-bernat/kanjivg/actions/workflows/flutter_checks.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/flutter_checks.yaml) |
|                                                                                                                                                                                 |                                                                                                                                                                                               |

`kanjivg` and `flutter_kanjivg` provide a simple way of interacting with data from the [KanjiVG (Kanji Vector Graphics) project](https://kanjivg.tagaini.net).

> Those packages are neither supported nor related to the creators of the KanjiVG project.

## Documentation

- [kanjivg](https://github.com/n-bernat/kanjivg/tree/master/kanjivg)

  Base parser for SVG files from the KanjiVG project. Provides metadata like stroke count, original radical forms (e.g. 人 for 亻), position of radicals and more.

- [flutter_kanjivg](https://github.com/n-bernat/kanjivg/tree/master/flutter_kanjivg)

  Flutter widgets that simplify displaying animated kanji. When using `flutter_kanjivg` there is no need to add `kanjivg` to your dependencies as `flutter_kanjivg` imports it itself.

## Version constraints

- Dart >= 3.1.0
- Flutter >= 3.10.0

## Maintainers

- [Nikodem Bernat](https://nikodembernat.com)