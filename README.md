# KanjiVG for Flutter & Dart

[![Publisher](https://img.shields.io/pub/publisher/kanjivg.svg)](https://pub.dev/packages/kanjivg/publisher)
[![MIT License](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![codecov](https://codecov.io/gh/n-bernat/kanjivg/graph/badge.svg?token=VDZJJ9TMAL)](https://codecov.io/gh/n-bernat/kanjivg)
[![LeanCode Style](https://img.shields.io/badge/style-leancode__lint-black)](https://pub.dartlang.org/packages/leancode_lint)
| `kanjivg` | `flutter_kanjivg` |
| :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| [![Package](https://img.shields.io/pub/v/kanjivg.svg)](https://pub.dev/packages/kanjivg) | [![Package](https://img.shields.io/pub/v/flutter_kanjivg.svg)](https://pub.dev/packages/flutter_kanjivg) |
| [![kanjivg - Checks](https://github.com/n-bernat/kanjivg/actions/workflows/dart_checks.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/dart_checks.yaml) | [![flutter_kanjivg - Checks](https://github.com/n-bernat/kanjivg/actions/workflows/flutter_checks.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/flutter_checks.yaml) |

`kanjivg` and `flutter_kanjivg` provide a simple way of interacting with data from the [KanjiVG (Kanji Vector Graphics) project](https://kanjivg.tagaini.net).

> Those packages are neither supported nor related to the creators of the KanjiVG project.

Some parts of comments in this library may consist of descriptions from the original KanjiVG website which is licensed under the [Creative Commons Attribution-Share Alike 3.0](https://creativecommons.org/licenses/by-sa/3.0) license.

## Documentation

- [kanjivg](https://github.com/n-bernat/kanjivg/tree/master/kanjivg)

  Base parser for SVG files from the KanjiVG project. Provides metadata like stroke count, original radical forms (e.g. 人 for 亻), the position of radicals and more.

- [flutter_kanjivg](https://github.com/n-bernat/kanjivg/tree/master/flutter_kanjivg)

  Flutter widgets that simplify displaying animated kanji. When using `flutter_kanjivg` there is no need to add `kanjivg` to your dependencies as `flutter_kanjivg` imports it itself.

## Version constraints

- Dart >= 3.5.0
- Flutter >= 3.24.0

## Maintainers

- [Nikodem Bernat](https://nikodembernat.com)
