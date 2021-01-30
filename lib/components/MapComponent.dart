import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ShopModel.dart';
import 'package:flutter_app/pages/DetailsPage.dart';
import 'package:flutter_app/types/Shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponent extends StatelessWidget {
  final Stream<List<Shop>> shopsStream;
  final Stream<LatLng> latLagStream;

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};

  MapComponent({this.shopsStream, this.latLagStream});

  void _addMarker(BuildContext context, Shop shop) {
    _markers.add(Marker(
      markerId: MarkerId('shop_${shop.hashCode.toString()}'),
      position: shop.latLng,
      infoWindow: InfoWindow(title: shop.name),
      onTap: () {
        _pushDetailPage(context, shop);
      },
    ));
  }

  void _pushDetailPage(BuildContext context, Shop shop) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  shop: shop,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LatLng>(
        stream: latLagStream,
        builder: (context, latLngSnapshot) {
          return StreamBuilder<List<Shop>>(
            stream: shopsStream,
            builder: (context, shopsSnapshot) {
              return GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: latLngSnapshot.data,
                  zoom: 14.4746,
                ),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  shopsSnapshot.data.forEach((shop) {
                    _addMarker(context, shop);
                  });
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              );
            },
          );
        });
  }
}
