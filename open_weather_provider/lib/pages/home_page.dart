import 'package:flutter/material.dart';
import 'package:open_weather_provider/pages/search_page.dart';
import 'package:open_weather_provider/providers/providers.dart';
import 'package:open_weather_provider/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  late final WeatherProvider _weatherProv;

  @override
  void initState() {
    super.initState();
    _weatherProv = context.read<WeatherProvider>();
    _weatherProv.addListener(_registerListener);
  }

  @override
  void dispose() {
    _weatherProv.removeListener(_registerListener);
    super.dispose();
  }

  void _registerListener() {
    final WeatherState ws = context.read<WeatherProvider>().state;

    if (ws.status == WeatherStatus.error) {
      errorDialog(context, ws.error.errMsg);
    }
  }

  Widget _showWeather() {
    final state = context.watch<WeatherProvider>().state;

    if (state.status == WeatherStatus.initial) {
      return Center(
        child: Text(
          '도시를 선택해 주세요.',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    if (state.status == WeatherStatus.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.status == WeatherStatus.error && state.weather.name == '') {
      return Center(
        child: Text(
          '도시를 선택해 주세요.',
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return Center(
      child: Text(
        state.weather.name,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            onPressed: () async {
              _city = await Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SearchPage();
                },
              ));

              print('city: $_city');

              if (_city != null) {
                context.read<WeatherProvider>().fetchWeather(_city!);
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _showWeather(),
    );
  }
}
