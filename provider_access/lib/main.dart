import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_12/models/counter.dart';
import 'package:provider_overview_12/show_me_counter.dart';

void main() {
  runApp(MyApp());
}

// Anonymous route
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChangeNotifierProvider<Counter>(
//         create: (context) => Counter(),
//         child: const MyHomePage(),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (counterContext) {
//                       return ChangeNotifierProvider.value(
//                         value: context.read<Counter>(),
//                         child: const ShowMeCounter(),
//                       );
//                     },
//                   ),
//                 );
//               },
//               child: const Text(
//                 'Show Me Counter',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<Counter>().increment();
//               },
//               child: const Text(
//                 'Increment Counter',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Named Route
// class MyApp extends StatefulWidget {
//
//   MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final Counter _counter = Counter();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         '/': (context) => ChangeNotifierProvider.value(
//               value: _counter,
//               child: MyHomePage(),
//             ),
//         '/counter': (context) => ChangeNotifierProvider.value(
//               value: _counter,
//               child: ShowMeCounter(),
//             ),
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _counter.dispose();
//     super.dispose();
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/counter');
//               },
//               child: const Text(
//                 'Show Me Counter',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<Counter>().increment();
//               },
//               child: const Text(
//                 'Increment Counter',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Generated route
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: MyHomePage(),
              ),
            );
          case '/counter':
            return MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                value: _counter,
                child: ShowMeCounter(),
              ),
            );
          default:
            return null;
        }
      },
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter');
              },
              child: const Text(
                'Show Me Counter',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Counter>().increment();
              },
              child: const Text(
                'Increment Counter',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
