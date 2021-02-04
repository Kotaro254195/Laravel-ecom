import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Shop {
  final String name;
  final num evaluation;
  final String telephone;
  final LatLng latLng;
  final num congestion;

  Shop(
      {this.name,
      this.evaluation,
      this.telephone,
      this.latLng,
      this.congestion});

  factory Shop.formJson(Map<String, dynamic> json) {
    return Shop(
        name: json["name"] as String,
        evaluation: json["evaluation"] as num,
        telephone: json["telephone_number"] as String,
        congestion: json["congestion"] as num,
        latLng: LatLng(
            json["location"]["lat"] as num, json["location"]["lng"] as num));
  }

  @override
  String toString() {
    return "Shop Instance > name: ${this.name}, evaluation: ${this.evaluation}, phone: ${this.telephone}, congestion: ${this.congestion}, latLng: ${this.latLng.latitude} ${this.latLng.longitude}";
  }
}
