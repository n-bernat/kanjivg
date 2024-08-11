import 'package:flutter/material.dart';
import 'package:flutter_kanjivg/flutter_kanjivg.dart';

void main() {
  return runApp(
    MaterialApp(
      home: const ExamplePage(),
    ),
  );
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage>
    with TickerProviderStateMixin {
  late final KanjiController controller = KanjiController(
    vsync: this,
    duration: const Duration(seconds: 5),
  );

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    const parser = KanjiParser();

    // Loads a sample SVG file from assets (和 in this example).
    final bundle = DefaultAssetBundle.of(context);
    final kvg = await bundle.loadString('assets/0548c.svg');
    final data = parser.parse(kvg);

    controller
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
      appBar: AppBar(
        title: Text('flutter_kanjivg'),
      ),
      body: Center(
        child: Card(
          child: KanjiCanvas(
            size: 260,
            thickness: 8,
            controller: controller,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Toggle',
        onPressed: controller.toggle,
        child: ListenableBuilder(
          listenable: controller,
          builder: (context, child) => controller.isPlaying
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
