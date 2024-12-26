import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview/models/babies.dart';
import 'package:provider_overview/models/dog.dart';
import 'package:provider_overview/screens/provider_overview_04.dart';
import 'package:provider_overview/screens/provider_overview_05.dart';
import 'package:provider_overview/screens/provider_overview_06.dart';
import 'package:provider_overview/screens/provider_overview_07.dart';
import 'package:provider_overview/screens/provider_overview_08.dart';
import 'package:provider_overview/screens/provider_overview_09.dart';

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
        ),
        StreamProvider<String>(
          create: (context) {
            final int dogAge = context.read<Dog>().age;
            final babies = Babies(age: dogAge * 2);
            return babies.bark();
          },
          initialData: 'Bark 0 times',
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          dialogTheme: const DialogTheme(
            backgroundColor: Colors.white, // 앱 전체 다이얼로그 배경색 설정
            surfaceTintColor: Colors.white,
          ),
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
              child: const Text('ChangeNotifierProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview05()),
                );
              },
              child: const Text('Extension Methods'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview06()),
                );
              },
              child: const Text('FutureProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview07()),
                );
              },
              child: const Text('StreamProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview08()),
                );
              },
              child: const Text('Consumer'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderOverview09()),
                );
              },
              child: const Text('ProviderNotFoundException'),
            ),
          ],
        ),
      ),
    );
  }
}
