import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/DetailsPage.dart';

class MapPage extends StatefulWidget {

  final List<Shop> shops;
  MapPage({this.shops});

  @override
  _MapPage createState() => _MapPage();
}

class _MapPage extends State<MapPage>
{
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  double position_lat; //緯度
  double position_long;//経度

  @override
  void initState() {
    super.initState();
    _getLocation(context);
  }

  //現在地座標取得
  Future<void> _getLocation(context) async {
    Position _currentPosition = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high); // ここで精度を「high」に指定している

    setState(() {
      List<String>list=_currentPosition.toString().split(",");
      position_lat = double.parse(list[0].substring(5));
      position_long= double.parse(list[1].substring(6));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(position_lat, position_long),
          zoom: 14.4746,
        ),

        markers: _markers,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            widget.shops.forEach((shop) {
              _markers.add(
                Marker(
                  markerId: MarkerId('shop_'+widget.shops.indexOf(shop).toString()),
                  position: LatLng(shop.coordinate[0],shop.coordinate[1]),
                  infoWindow: InfoWindow(title: shop.name),
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (cotext)=>DetailsPage(shop: widget.shops[widget.shops.indexOf(shop)])));
                  },
                )
              );
            });
          });
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}