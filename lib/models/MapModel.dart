import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel {
  final StreamController<LatLng> _currentLocationController =
      StreamController<LatLng>();
  final StreamController<Position> _positionController =
      StreamController<Position>();

  MapModel() {
    _positionController.stream
        .map((position) => LatLng(position.latitude, position.longitude))
        .listen((latLag) {
      _currentLocationController.sink.add(latLag);
    });
  }

  StreamSink<LatLng> get latLngSink => _currentLocationController.sink;

  StreamSink<Position> get positionSink => _positionController.sink;

  Stream<LatLng> get latLngStream => _currentLocationController.stream;

  void dispose() async {
    await _currentLocationController.close();
    await _positionController.close();
  }
}
