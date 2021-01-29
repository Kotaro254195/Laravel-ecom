import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/DetailsPage.dart';

import 'types/Shop.dart';

class MapPage extends StatefulWidget {
  final List<Shop> shops;

  MapPage({this.shops});

  @override
  _MapPage createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  LatLng currentLatLng;

  @override
  void initState() {
    super.initState();
    _getLocation(context);
  }

  //現在地座標取得
  Future<void> _getLocation(context) async {
    Position _currentPosition = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high); // ここで精度を「high」に指定している

    setState(() {
      currentLatLng =
          LatLng(_currentPosition.latitude, _currentPosition.longitude)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: currentLatLng,
          zoom: 14.4746,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            widget.shops.forEach((shop) {
              _markers.add(Marker(
                markerId:
                MarkerId('shop_' + widget.shops.indexOf(shop).toString()),
                position: shop.latLng,
                infoWindow: InfoWindow(title: shop.name),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (cotext) =>
                              DetailsPage(
                                  shop: widget.shops[widget.shops.indexOf(
                                      shop)])));
                },
              ));
            });
          });
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
