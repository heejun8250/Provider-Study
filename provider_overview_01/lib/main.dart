import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                'MyHomPage',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(height: 20),
            CounterA(counter: counter, increment: increment),
            const SizedBox(height: 20),
            Middle(counter: counter),
          ],
        ),
      ),
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final void Function() increment;
  const CounterA({super.key, required this.counter, required this.increment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '$counter',
            style: const TextStyle(fontSize: 48),
          ),
          ElevatedButton(
            onPressed: increment,
            child: const Text(
              'Increment',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;
  const Middle({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterB(counter: counter),
          const SizedBox(width: 20),
          const Sibling(),
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  final int counter;
  const CounterB({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10),
      child: Text(
        '$counter',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10),
      child: const Text(
        'Sibling',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
