import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/types/result.dart';
import 'package:flutter_app/types/shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class ShopsModel{
  ShopsModel() {
    _shopAppendingController.stream.listen((shop) {
      _shops.add(shop);
      _shopsController.sink.add(_shops);
    });

    _shopsController.stream.listen((shops) {
      _shops = shops;
    });
  }

  final BehaviorSubject<List<Result>> _shopsController =
      BehaviorSubject<List<Result>>.seeded([]);

  final StreamController<Result> _shopAppendingController = StreamController();

  List<Result> _shops = [];
  int selectedId;

  Set<Shop> currentShops() {
    final shopList = <Shop>[];
    _shops.forEach((result) {
      result.when(
          shop: (dynamic s) {
            shopList.add(s as Shop);
          },
          tweet: null);
    });
    return shopList.toSet();
  }

  // Set<Marker> get currentMarkers => _shops
  //     .map((shop) => Marker(
  //           markerId: MarkerId('shop_${shop.hashCode.toString()}'),
  //           position: shop.latLng,
  //           infoWindow: InfoWindow(title: shop.name),
  //         ))
  //     .toSet();

  Stream<List<Shop>> get shopsStream =>
      _shopsController.stream.map((resultList) {
        final shopList = <Shop>[];
        resultList.forEach((result) {
          result.when(
              shop: (dynamic s) {
                shopList.add(s as Shop);
              },
              tweet: (dynamic s) {});
        });
        return shopList;
      });

  Stream<Set<Marker>> get markersStream {
    return _shopsController.stream.asyncMap((shops) async {
      final bitmap = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), 'lib/assets/twitter_bird.png');
      return shops.map((shop) {
        return shop.when(
            shop: (dynamic s) {
              final marker = Marker(
                  markerId: MarkerId(Random.secure().nextInt(100000000).toString()),
                  position: (s as Shop).latLng,
                  infoWindow: InfoWindow(title: (s as Shop).name),

              );
              return marker;
            },
            tweet: (dynamic t) {
              return Marker(
                  markerId: MarkerId(Random.secure().nextInt(100000000).toString()),
                  position: (t as Tweet).latLng,
                  icon: bitmap
              );
            }
        );
      }).toSet();
    });
  }

  StreamSink<Result> get shopAppendSink => _shopAppendingController.sink;

  StreamSink<List<Result>> get shopsUpdatingSink => _shopsController.sink;

  void dispose() {
    _shopsController.close();
    _shopAppendingController.close();
  }
}
