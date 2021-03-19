import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/api/restaurant.dart';
import 'package:flutter_app/types/shop.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Stream<List<Shop>> fetchRecommendationShops() {
  return requestRestaurants()
      .map<dynamic>((request) => json.decode(utf8.decode(request.bodyBytes)))
      .cast<List<Map<String, dynamic>>>()
      .map((shopList) => shopList.map((shop) => Shop.formJson(shop)).toList());
}

/// サーバを利用しない場合はこちらを利用
Stream<List<Shop>> fetchTestRecommendationShops() {
  return Stream.fromIterable([
    [
      Shop(
          name: 'マクドナルド',
          evaluation: 4.4,
          telephone: '01201234567',
          latLng: const LatLng(37.03146701139306, 140.89013741073236),
          congestion: 50.1),
      Shop(
          name: 'ケンタッキー',
          evaluation: 2,
          telephone: '01209999999',
          latLng: const LatLng(37.032489787517584, 140.8893454202752),
          congestion: 25.1),
      Shop(
          name: 'モスバーガー',
          evaluation: 3.5,
          telephone: '01209876543',
          latLng: const LatLng(37.032489787517777, 140.8893454202777),
          congestion: 32.1)
    ]
  ]);
}
