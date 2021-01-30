import 'package:flutter/material.dart';
import 'package:flutter_app/components/MapComponent.dart';
import 'package:flutter_app/models/MapModel.dart';
import 'package:flutter_app/models/ShopModel.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatelessWidget {
  final MapModel mapModel;
  final ShopsModel shopsModel;

  MapPage({this.mapModel, this.shopsModel});

  void _reloadCurrentLocation() {
    Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .asStream()
        .listen(mapModel.positionSink.add);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapComponent(
        shopsStream: shopsModel.shopsStream,
        latLagStream: mapModel.latLngStream,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reloadCurrentLocation,
        tooltip: 'reload current location',
        child: Icon(Icons.my_location),
      ),
    );
  }
}
