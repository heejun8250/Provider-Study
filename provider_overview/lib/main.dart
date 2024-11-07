import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview/models/babies.dart';
import 'package:provider_overview/models/dog.dart';
import 'package:provider_overview/screens/provider_overveiw_04.dart';
import 'package:provider_overview/screens/provider_overview_05.dart';
import 'package:provider_overview/screens/provider_overview_06.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(name: 'dog', breed: 'breed', age: 3),
        ),
        FutureProvider<int>(
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge);
            return babies.getBabies();
          },
          initialData: 0,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
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
        title: const Text('Provider Overview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview04()),
                );
              },
              child: const Text('Overview 04'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview05()),
                );
              },
              child: const Text('Overview 05'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview06()),
                );
              },
              child: const Text('Overview 06'),
            ),
          ],
        ),
      ),
    );
  }
}
