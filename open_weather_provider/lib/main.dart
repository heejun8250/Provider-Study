import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:open_weather_provider/pages/home_page.dart';
import 'package:open_weather_provider/providers/providers.dart';
import 'package:open_weather_provider/providers/weather/weather_provider.dart';
import 'package:open_weather_provider/repositories/weather_repository.dart';
import 'package:open_weather_provider/services/weather_api_services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherRepository>(
          create: (context) => WeatherRepository(
            weatherApiServices: WeatherApiServices(
              httpClient: http.Client(),
            ),
          ),
        ),
        ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider(
            weatherRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<TempSettingsProvider>(
          create: (context) => TempSettingsProvider(),
        ),
        ChangeNotifierProxyProvider<WeatherProvider, ThemeProvider>(
          create: (context) => ThemeProvider(),
          update: (context, WeatherProvider weatherProvider, ThemeProvider? themeProvider) => themeProvider!..update(weatherProvider),
        )
      ],
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: context.watch<ThemeProvider>().state.appTheme == AppTheme.light ? ThemeData.light() : ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
