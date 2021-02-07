import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Shop {
  Shop({
    this.name,
    this.evaluation,
    this.telephone,
    this.latLng,
    this.congestion
  });

  factory Shop.formJson(Map<String, dynamic> json) {
    return Shop(
        name: json['name'] as String,
        evaluation: json['evaluation'] as num,
        telephone: json['telephone_number'] as String,
        congestion: json['congestion'] as num,
        latLng: LatLng(
            json['location']['lat'] as double,
            json['location']['lng'] as double
        )
    );
  }
  final String name;
  final num evaluation;
  final String telephone;
  final LatLng latLng;
  final num congestion;





  @override
  String toString() {
    return '''
    Shop Instance > name: $name, evaluation: $evaluation, 
    phone: $telephone, congestion: $congestion, 
    latLng: ${latLng.latitude} ${latLng.longitude}
    ''';
  }
}
