import 'dart:async';

import 'package:flutter_app/types/Shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopsModel {
  final StreamController<List<Shop>> _shopsController =
      StreamController<List<Shop>>.broadcast();
  final StreamController<Shop> _shopAppendingController = StreamController();

  List<Shop> _shops = [];

  ShopsModel() {
    _shopAppendingController.stream.listen((shop) {
      _shops.add(shop);
      _shopsController.sink.add(_shops);
    });

    _shopsController.stream.listen((shops) {
      _shops = shops;
    });
  }

  Set<Shop> get currentShops => _shops.toSet();

  Set<Marker> get currentMarkers => _shops
      .map((shop) => Marker(
            markerId: MarkerId("shop_${shop.hashCode.toString()}"),
            position: shop.latLng,
            infoWindow: InfoWindow(title: shop.name),
          ))
      .toSet();

  Stream<List<Shop>> get shopsStream => _shopsController.stream;

  Stream<Set<Marker>> get markersStream =>
      _shopsController.stream.map((shops) => shops
          .map((shop) => Marker(
                markerId: MarkerId("shop_${shop.hashCode.toString()}"),
                position: shop.latLng,
                infoWindow: InfoWindow(title: shop.name),
              ))
          .toSet());

  StreamSink<Shop> get shopAppendSink => _shopAppendingController.sink;

  StreamSink<List<Shop>> get shopsUpdatingSink => _shopsController.sink;

  void dispose() {
    _shopsController.close();
    _shopAppendingController.close();
  }
}
