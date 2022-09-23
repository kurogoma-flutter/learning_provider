import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_provider/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('ボタンクリックで数字が増えます?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                context
                    .select((Counter counter) => counter.counterC)
                    .toString(),
                style: Theme.of(context).textTheme.headline4,
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
          IconButton(
            onPressed: () {
              final value = context.read<Counter>().counterA;
              // 画面遷移
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HooksSample(
                    title: '$value',
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}

class HooksSample extends HookWidget {
  const HooksSample({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        debugPrint(title);
        return null;
      },
      [],
    );
    final count = useState(0);

    void increment() {
      count.value++;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooksサンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${count.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class HookSample2 extends StatefulWidget {
  const HookSample2({super.key});

  @override
  State<HookSample2> createState() => _HookSample2State();
}

class _HookSample2State extends State<HookSample2> {
  @override
  void initState() {
    super.initState();
    debugPrint('initState');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    debugPrint('dispose');
  }

  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooksサンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
