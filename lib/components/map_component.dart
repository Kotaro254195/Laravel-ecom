import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/AppModel.dart';
import 'package:flutter_app/pages/DetailsPage.dart';
import 'package:flutter_app/types/Shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapComponent extends StatelessWidget {
  MapComponent({this.latLag});

  final LatLng latLag;

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};


  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    // final _pushDetailPage = (Shop shop) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => DetailsPage(
    //                 shop: shop,
    //               )));
    // };

    return StreamBuilder<Set<Marker>>(
      stream: appModel.shopsModel.markersStream,
      initialData: appModel.shopsModel.currentMarkers,
      builder: (context, markersSnapshot) {
        return GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: latLag,
            zoom: 14.4746,
          ),
          markers: markersSnapshot.data,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        );
      },
    );
  }
}
