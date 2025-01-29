import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview/models/foo.dart';

// builder 사용
// class ProviderOverview09 extends StatelessWidget {
//   const ProviderOverview09({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ProviderNotFoundException'),
//       ),
//       body: ChangeNotifierProvider<Foo>(
//         create: (_) => Foo(),
//         builder: (context, child) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   context.watch<Foo>().value,
//                   style: const TextStyle(fontSize: 20),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () => context.read<Foo>().changeValue(),
//                   child: const Text(
//                     'Change Value',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// Consumer 사용
class ProviderOverview09 extends StatelessWidget {
  const ProviderOverview09({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProviderNotFoundException'),
      ),
      body: ChangeNotifierProvider<Foo>(
        create: (_) => Foo(),
        child: Consumer<Foo>(
            builder: (context, value, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.value,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => value.changeValue(),
                      child: const Text(
                        'Change Value',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
