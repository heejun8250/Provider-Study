// 도시 이름을 통해 받아온 데이터에서 lat, lon을 통하여 받아오는 데이터

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String name;
  final String country;
  final DateTime lastUpdate;

  Weather({
    required this.description,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.name,
    required this.country,
    required this.lastUpdate,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    return Weather(
      description: weather['description'],
      icon: weather['icon'],
      temp: main['temp'].toDouble(),
      tempMin: main['temp_min'].toDouble(),
      tempMax: main['temp_max'].toDouble(),
      name: '',
      country: '',
      lastUpdate: DateTime.now(),
    );
  }

  factory Weather.initial() => Weather(
        description: '',
        icon: '',
        temp: 100.0,
        tempMin: 100.0,
        tempMax: 100.0,
        name: '',
        country: '',
        lastUpdate: DateTime(1970),
      );

  @override
  List<Object?> get props => [description, icon, temp, tempMin, tempMax, name, country, lastUpdate];

  @override
  String toString() {
    return 'Weather{description: $description, icon: $icon, temp: $temp, tempMin: $tempMin, tempMax: $tempMax, name: $name, country: $country, lastUpdate: $lastUpdate}';
  }

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? name,
    String? country,
    DateTime? lastUpdate,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp.toDouble(),
      tempMin: tempMin ?? this.tempMin.toDouble(),
      tempMax: tempMax ?? this.tempMax.toDouble(),
      name: name ?? this.name,
      country: country ?? this.country,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }
}
