import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapComponent extends StatelessWidget {
  MapComponent({this.latLag});

  final LatLng latLag;

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    return StreamBuilder<Set<Marker>>(
        stream: appModel.shopsModel.markersStream,
        builder: (context, markersSnapshot) {
          return GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: latLag,
              zoom: 14.4746,
              tilt: 45,
            ),
            markers: markersSnapshot.data,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          );
        });
  }
}

