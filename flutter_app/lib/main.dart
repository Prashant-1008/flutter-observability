import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ObservabilityApp());
}

class ObservabilityApp extends StatelessWidget {
  const ObservabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Observability App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() async {
    setState(() => _counter++);

    // Example HTTP request for tracing
    final traceId = DateTime.now().millisecondsSinceEpoch.toString();
    final spanId = (_counter * 1000).toString();

    try {
      await http.get(
        Uri.parse('https://example.com/ping'), // Dummy endpoint
        headers: {
          'traceparent': '00-$traceId-$spanId-01', // Simulated trace
        },
      );
    } catch (e) {
      // Ignore error – for tracing simulation
    }

    print('[INFO] Button clicked $_counter times');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Observability App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
