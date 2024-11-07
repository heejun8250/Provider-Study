import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview/models/dog.dart';

class ProviderOverview06 extends StatelessWidget {
  const ProviderOverview06({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 06'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${context.watch<Dog>().name}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed : ${context.select<Dog, String>((value) => value.breed)}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        const Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${context.select<Dog, int>((value) => value.age)}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          '- number of babies: ${context.watch<int>()}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            context.read<Dog>().grow();
          },
          child: const Text('Grow'),
        ),
      ],
    );
  }
}
