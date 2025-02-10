import 'package:flutter/material.dart';
import 'package:open_weather_provider_refactor/providers/providers.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text('표시 기호'),
          subtitle: Text('섭씨/화씨 (기본값: 섭씨)'),
          trailing: Switch(
            value: context.watch<TempSettingsProvider>().state.tempUnit == TempUnit.celsius,
            onChanged: (value) {
              context.read<TempSettingsProvider>().toggleTempUnit();
            },
          ),
        ),
      ),
    );
  }
}
