import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview/models/counter.dart';

// Builder 위젯 사용
class ProviderOverview11 extends StatelessWidget {
  const ProviderOverview11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProviderNotFoundException2'),
      ),
      body: Center(
        child: ChangeNotifierProvider<Counter>(
          create: (_) => Counter(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${context.watch<Counter>().counter}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counter>().increment();
                    },
                    child: const Text(
                      'Increment',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// 위젯 분리
// class ProviderOverview11 extends StatelessWidget {
//   const ProviderOverview11({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ProviderNotFoundException2'),
//       ),
//       body: Center(
//         child: ChangeNotifierProvider<Counter>(
//           create: (_) => Counter(),
//           child: const ChildWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class ChildWidget extends StatelessWidget {
//   const ChildWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '${context.watch<Counter>().counter}',
//           style: const TextStyle(fontSize: 20),
//         ),
//         const SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             context.read<Counter>().increment();
//           },
//           child: const Text(
//             'Increment',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),
//       ],
//     );
//   }
// }