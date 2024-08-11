<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# flutter_kanjivg

[![Package](https://img.shields.io/pub/v/flutter_kanjivg.svg)](https://pub.dev/packages/flutter_kanjivg) [![Publisher](https://img.shields.io/pub/publisher/flutter_kanjivg.svg)](https://pub.dev/packages/flutter_kanjivg/publisher) [![flutter_kanjivg - Checks](https://github.com/n-bernat/kanjivg/actions/workflows/flutter_checks.yaml/badge.svg)](https://github.com/n-bernat/kanjivg/actions/workflows/flutter_checks.yaml) [![MIT License](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT) [![LeanCode Style](https://img.shields.io/badge/style-leancode__lint-black)](https://pub.dartlang.org/packages/leancode_lint)

`flutter_kanjivg` provides a simple way of interacting with data from the [KanjiVG (Kanji Vector Graphics) project](https://kanjivg.tagaini.net). This package contains a parser for SVG files with extensions added by the maintainers of KanjiVG and Flutter widgets that simplify displaying animated kanji. It also provides metadata like stroke count, original radical forms (e.g. 人 for 亻), the position of radicals and more.

> This package is neither supported nor related to the creators of the KanjiVG project.

## Getting started

1. Add this package to your dependencies.

```yaml
dependencies:
  flutter_kanjivg: latest_version
```

2. Get the dependencies.

```sh
flutter pub get
```

When using `flutter_kanjivg` there is no need to add `kanjivg` to your dependencies as `flutter_kanjivg` imports it itself.

## Usage

The library doesn't include kanji data as there are over 10,000 files and it would be quite wasteful if you want to fetch them at runtime.
You can either:

1. download SVG files from [project's GitHub page](https://github.com/KanjiVG/kanjivg/releases),
2. self-host them and get SVG data from your server.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_kanjivg/flutter_kanjivg.dart';

class KanjiPage extends StatefulWidget {
  const KanjiPage({super.key});

  @override
  State<KanjiPage> createState() => _KanjiPageState();
}

class _KanjiPageState extends State<KanjiPage> with TickerProviderStateMixin {
  late final KanjiController controller;

  @override
  void initState() {
    super.initState();

    const source = '<?xml version="1.0" encoding="UTF-8"?> ... </svg>';
    const parser = KanjiParser();

    // Returns an instance of `KvgData` with `id`, `character`, `radicals` and `strokes`.
    final data = parser.parse(source);

    controller = KanjiController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..load(data)
      ..forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: KanjiCanvas(
          controller: controller,
          size: 260,
          thickness: 6,
          color: Colors.red,
          hintColor: Colors.red.withOpacity(0.33),
        ),
      ),
    );
  }
}
```

## Additional information

- This package requires at least Flutter 3.24 to work.
- If there are any issues feel free to go to [GitHub Issues](https://github.com/n-bernat/kanjivg/issues) and report a bug.

## Maintainers

- [Nikodem Bernat](https://nikodembernat.com)
