import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/api/restaurant.dart';
import 'package:flutter_app/types/result.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

Stream<List<Result>> fetchRecommendationShops() {
  return requestRestaurants().map<List<Map<String, dynamic>>>((request) {
    final json = List<Map<String, dynamic>>.from(
        jsonDecode(utf8.decode(request.bodyBytes)) as List<dynamic>);
    return json;
  }).map((shops) =>
      shops.map((shop) => Result.shop(Shop.formJson(shop))).toList());
}

Stream<List<Result>> fetchTweets() {
  return requestTwitter().map<List<Map<String, dynamic>>>((request) {
    final json = List<Map<String, dynamic>>.from(
        jsonDecode(utf8.decode(request.bodyBytes)) as List<dynamic>);
    return json;
  }).map((tweets) =>
      tweets.map((tweet) => Result.tweet(Tweet.formJson(tweet))).toList());
}

Stream<List<Result>> fetchApiInfo() => Rx.combineLatest2(
    fetchRecommendationShops(),
    fetchTweets(),
    (List<Result> shops, List<Result> tweet) => [...shops, ...tweet]);

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
          latLng: const LatLng(37.03146701139306, 140.8893454202752),
          congestion: 32.1)
    ]
  ]);
}
