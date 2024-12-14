# KanjiVG for Flutter & Dart

[![Publisher](https://img.shields.io/pub/publisher/kanjivg.svg)](https://pub.dev/packages/kanjivg/publisher)
[![MIT License](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![LeanCode Style](https://img.shields.io/badge/style-leancode__lint-black)](https://pub.dartlang.org/packages/leancode_lint)

|                                                                                    Status                                                                                     |               Comments               |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | :----------------------------------: |
| [![Tests (stable)](https://github.com/n-bernat/kanjivg/actions/workflows/test_stable.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/test_stable.yaml) |    Current stable Flutter version    |
|    [![Tests (beta)](https://github.com/n-bernat/kanjivg/actions/workflows/test_beta.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/test_beta.yaml)    |     Current beta Flutter version     |
|    [![Tests (3.24.0)](https://github.com/n-bernat/kanjivg/actions/workflows/test_min.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/test_min.yaml)    | The oldest supported Flutter version |

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
