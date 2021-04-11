import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/map_component.dart';
import 'package:flutter_app/models/app_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    Set<StreamSubscription<Position>> reloadCurrentLocation() => {
          Geolocator()
              .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
              .asStream()
              .listen(appModel.mapModel.positionSink.add)
        };

    reloadCurrentLocation();

    return Scaffold(
        body: StreamBuilder<LatLng>(
      stream: appModel.mapModel.latLngStream,
      builder: (context, latLngSnapshot) {
        return latLngSnapshot.hasData
            ? MapComponent(
                latLag: latLngSnapshot.data,
              )
            : const Center(
                child: Text('Loading...'),
              );
      },
    ));
  }
}
