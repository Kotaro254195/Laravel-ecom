import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/api/EndpointTypes.dart';
import 'package:flutter_app/api/restaurant.dart';
import 'package:flutter_app/services/ApiInfoService.dart';
import 'package:flutter_app/types/Shop.dart';
import 'package:http/http.dart' as http;

Stream<List<Shop>> fetchRecommendationShops() {
  return requestRestaurants()
      .map((request) => json.decode(utf8.decode(request.bodyBytes)))
      .cast<List>()
      .map((shopList) => shopList.map((shop) => Shop.formJson(shop)).toList());
}

// return Stream.fromIterable([
// [
// Shop(
// name: 'マクドナルド',
// evaluation: 4.4,
// telephone: '01201234567',
// latLng: LatLng(37.03146701139306, 140.89013741073236),
// congestion: 50.1),
// Shop(
// name: 'ケンタッキー',
// evaluation: 2,
// telephone: '01209999999',
// latLng: LatLng(37.032489787517584, 140.8893454202752),
// congestion: 25.1),
// Shop(
// name: 'モスバーガー',
// evaluation: 3.5,
// telephone: '01209876543',
// latLng: LatLng(37.032489787517777, 140.8893454202777),
// congestion: 32.1)
// ]

//apiからJsonデータ取得、加工部分　参考：https://eh-career.com/engineerhub/entry/2019/08/06/103000
// Future<void> _load() async {
//   final res = await http.get('https://api.github.com/repositories/31792824/issues');
//   final data = json.decode(res.body);
//   setState(() {
//     // _data=res.body;
//     final shops = data as List;
//     shops.forEach((dynamic element) {
//       final shop = element as Map;
//       _shops.add(Shop(
//         name:shop['name'] as String,
//         evaluation: shop['evaluation'] as Float,
//         telephone: shop['telephone'] as String,
//         coordinate: shop['coordinate'] as List<double>,
//         congestion: shop['congestion'] as Float
//       ));
//     });
//   });
// }
