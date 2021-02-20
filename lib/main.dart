import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // * Wrapping the entire app in a scope provider to
  // * use the riverpod package
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  final valueProvider = Provider<int>((ref) {
    return 90;
  });

  final counterStateProvider = StateProvider<int>((ref) {
    return 0;
  });


  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final counter = watch(counterStateProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value: ${counter.state}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterStateProvider).state++,
        child: Icon(Icons.add),
      ),
    );
  }
}
