import 'dart:async';

import 'package:flutter_app/types/Shop.dart';

class ShopsModel {
  final StreamController<List<Shop>> _shopsController = StreamController();
  final StreamController<Shop> _shopAppendingController = StreamController();

  final List<Shop> _shops = [];

  ShopModel() {
    _shopAppendingController.stream.listen((shop) {
      _shops.add(shop);
    });
    _shopsController.stream.listen((shops) {
      _shops.clear();
      _shops.addAll(shops);
    });
  }

  Stream<List<Shop>> get shopsStream =>
      _shopsController.stream.map((_) => _shops);

  StreamSink<Shop> get shopAppendSink => _shopAppendingController.sink;

  StreamSink<List<Shop>> get shopsUpdatingSink => _shopsController.sink;

  void dispose() async {
    await _shopsController.close();
    await _shopAppendingController.close();
  }
}
