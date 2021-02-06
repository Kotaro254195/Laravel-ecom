import 'package:flutter/material.dart';
import 'package:flutter_app/components/map_component.dart';
import 'package:flutter_app/models/app_model.dart';
import 'package:flutter_app/types/Shop.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    final reloadCurrentLocation = () {
      Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .asStream()
          .listen(appModel.mapModel.positionSink.add);
    };
    reloadCurrentLocation();

    return Scaffold(
      body: StreamBuilder(
        stream: appModel.mapModel.latLngStream,
        builder: (context, latLngSnapshot) {
          return latLngSnapshot.hasData
              ? MapComponent(
                  latLag: latLngSnapshot.data,
                )
              : Center(
                  child: Text("Loading..."),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: reloadCurrentLocation,
        tooltip: 'reload current location',
        child: Icon(Icons.my_location),
      ),
    );
  }
}
