import 'package:flutter/material.dart';
import 'package:learning_provider/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('ボタンクリックで数字が増えます?'),
        Row(
          children: [
            Consumer<Counter>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.counterA}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(width: 15),
            Text(
              context.watch<Counter>().counterA.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Row(
          children: [
            Consumer<Counter>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.counterB}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(width: 15),
            Text(
              context.read<Counter>().counterB.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
        Row(
          children: [
            Consumer<Counter>(
              builder: (context, counter, child) {
                return Text(
                  '${counter.counterC}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(width: 15),
            Text(
              context.select((Counter counter) => counter.counterC).toString(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().incrementA();
              },
              child: const Text('A'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().incrementB();
              },
              child: const Text('B'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().incrementC();
              },
              child: const Text('C'),
            ),
          ],
        ),
      ],
    );
  }
}
