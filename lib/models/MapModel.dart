import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel {
  final StreamController<LatLng> _currentLatLngController =
      StreamController<LatLng>.broadcast();
  final StreamController<Position> _positionController =
      StreamController<Position>();

  MapModel() {
    _positionController.stream
        .map((position) => LatLng(position.latitude, position.longitude))
        .listen((latLag) {
      _currentLatLngController.sink.add(latLag);
    });
  }

  StreamSink<LatLng> get latLngSink => _currentLatLngController.sink;

  StreamSink<Position> get positionSink => _positionController.sink;

  Stream<LatLng> get latLngStream => _currentLatLngController.stream;

  void dispose() {
    _currentLatLngController.close();
    _positionController.close();
  }
}
