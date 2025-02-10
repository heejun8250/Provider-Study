// 도시 이름을 통해 받아오는 json 데이터

import 'package:equatable/equatable.dart';

class DirectGeocoding extends Equatable {
  final String name;
  final double lat;
  final double lon;
  final String country;

  DirectGeocoding({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory DirectGeocoding.fromJson(List<dynamic> json) {
    // json 리스트의 첫 번째 값만 사용
    final Map<String, dynamic> data = json[0];

    return DirectGeocoding(
      name: data['name'],
      lat: data['lat'],
      lon: data['lon'],
      country: data['country'],
    );
  }

  @override
  List<Object> get props => [name, lat, lon, country];

  @override
  String toString() {
    return 'DirectGeocoding{name: $name, lat: $lat, lon: $lon, country: $country}';
  }
}
