import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/AppModel.dart';
import 'package:flutter_app/pages/DetailsPage.dart';
import 'package:flutter_app/types/Shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapComponent extends StatelessWidget {
  final LatLng latLag;

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};

  MapComponent({this.latLag});

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    final _pushDetailPage = (Shop shop) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(
                    shop: shop,
                  )));
    };
    final _addMarker = (Shop shop) {
      _markers.add(Marker(
        markerId: MarkerId('shop_${shop.hashCode.toString()}'),
        position: shop.latLng,
        infoWindow: InfoWindow(title: shop.name),
        onTap: () {
          _pushDetailPage(shop);
        },
      ));
    };

    return StreamBuilder<List<Shop>>(
      stream: appModel.shopsModel.shopsStream,
      builder: (context, shopsSnapshot) {
        return GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: latLag,
            zoom: 14.4746,
          ),
          markers: _markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            if (shopsSnapshot.hasData) {
              shopsSnapshot.data.forEach((shop) {
                _addMarker(shop);
              });
            }
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        );
      },
    );
  }
}
