import 'package:flutter/material.dart';
import 'package:open_weather_provider/constants/constants.dart';
import 'package:open_weather_provider/pages/search_page.dart';
import 'package:open_weather_provider/pages/settings_page.dart';
import 'package:open_weather_provider/providers/providers.dart';
import 'package:open_weather_provider/widgets/error_dialog.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

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

  String showTemperature(double temperature) {
    final tempUnit = context.watch<TempSettingsProvider>().state.tempUnit;

    if (tempUnit == TempUnit.fahrenheit) {
      return ((temperature * 9 / 5) + 32).toStringAsFixed(2) + '℉';
    }

    return temperature.toStringAsFixed(2) + '℃';
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

    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 6,
        ),
        Text(
          state.weather.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TimeOfDay.fromDateTime(state.weather.lastUpdate).format(context),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 10),
            Text(
              '(${state.weather.country})',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              showTemperature(state.weather.temp),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  showTemperature(state.weather.tempMax),
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  showTemperature(state.weather.tempMin),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            showIcon(state.weather.icon),
            Expanded(
              flex: 3,
              child: formatText(state.weather.description),
            ),
            Spacer(),
          ],
        )
      ],
    );
  }

  Widget showIcon(String icon) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/loading.gif',
      image: 'http://$kIconHost/img/wn/$icon@4x.png',
      width: 96,
      height: 96,
    );
  }

  Widget formatText(String description) {
    final formattedString = description.titleCase;

    return Text(
      formattedString,
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SettingsPage();
                }),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: _showWeather(),
    );
  }
}
