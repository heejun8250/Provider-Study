import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview/models/dog.dart';

class ProviderOverview10 extends StatelessWidget {
  const ProviderOverview10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selector'),
      ),
      body: Selector<Dog, String>(
        selector: (context, Dog dog) => dog.name,
        builder: (context, String name, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                Text(
                  '- name: $name',
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
    return Selector<Dog, String>(
      selector: (context, Dog dog) => dog.breed,
      builder: (context, String breed, child) {
        return Column(
          children: [
            Text(
              '- breed : $breed',
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
    return Selector<Dog, int>(
      selector: (context, Dog dog) => dog.age,
      builder: (context, int age, child) {
        return Column(
          children: [
            Text(
              '- age: $age',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Dog>().grow();
              },
              child: const Text('Grow'),
            ),
          ],
        );
      },
    );
  }
}
