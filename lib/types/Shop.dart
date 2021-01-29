import 'package:google_maps_flutter/google_maps_flutter.dart';

class Shop {
  Shop(
      {this.name,
      this.evaluation,
      this.telephone,
      this.latLng,
      this.congestion});

  final String name;
  final double evaluation;
  final String telephone;
  final LatLng latLng;
  final double congestion;
}
