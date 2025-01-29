import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview/models/dog.dart';

class ProviderOverview08 extends StatelessWidget {
  const ProviderOverview08({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer'),
      ),
      body: Consumer<Dog>(
        builder: (context, value, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                Text(
                  '- name: ${value.name}',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                const BreedAndAge(),
              ],
            ),
          );
        },
        child: const Text(
          'I like dog',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (context, value, child) {
        return Column(
          children: [
            Text(
              '- breed : ${value.breed}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Age(),
          ],
        );
      },
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Dog>(
      builder: (context, value, child) {
        return Column(
          children: [
            Text(
              '- age: ${value.age}',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                value.grow();
              },
              child: const Text('Grow'),
            ),
          ],
        );
      },
    );
  }
}
