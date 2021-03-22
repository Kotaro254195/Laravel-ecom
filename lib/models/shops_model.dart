import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/types/shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class ShopsModel {
  ShopsModel() {
    _shopAppendingController.stream.listen((shop) {
      _shops.add(shop);
      _shopsController.sink.add(_shops);
    });

    _shopsController.stream.listen((shops) {
      _shops = shops;
    });
  }

  final BehaviorSubject<List<Shop>> _shopsController =
      BehaviorSubject<List<Shop>>.seeded([]);

  final StreamController<Shop> _shopAppendingController = StreamController();

  List<Shop> _shops = [];

  Set<Shop> get currentShops => _shops.toSet();

  // Set<Marker> get currentMarkers => _shops
  //     .map((shop) => Marker(
  //           markerId: MarkerId('shop_${shop.hashCode.toString()}'),
  //           position: shop.latLng,
  //           infoWindow: InfoWindow(title: shop.name),
  //         ))
  //     .toSet();

  Stream<List<Shop>> get shopsStream => _shopsController.stream;

  Stream<Set<Marker>> get markersStream {
    return _shopsController.stream.asyncMap((shops) async {
      final bitmap = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), 'lib/assets/twitter_chat.png');
      return shops
          .map((shop) => Marker(
              markerId: MarkerId('shop_${shop.hashCode.toString()}'),
              position: shop.latLng,
              infoWindow: InfoWindow(title: shop.name),
              icon: bitmap))
          .toSet();
    });
  }

  StreamSink<Shop> get shopAppendSink => _shopAppendingController.sink;

  StreamSink<List<Shop>> get shopsUpdatingSink => _shopsController.sink;

  void dispose() {
    _shopsController.close();
    _shopAppendingController.close();
  }
}
