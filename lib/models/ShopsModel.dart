import 'dart:async';

import 'package:flutter_app/types/Shop.dart';

class ShopsModel {
  final StreamController<List<Shop>> _shopsController =
      StreamController<List<Shop>>.broadcast();
  final StreamController<Shop> _shopAppendingController = StreamController();

  List<Shop> _shops = [];

  ShopsModel({List<Shop> initValue = const []}) {
    _shops = initValue;

    _shopAppendingController.stream.listen((shop) {
      _shops.add(shop);
    });
  }

  Stream<List<Shop>> get shopsStream =>
      _shopsController.stream.map((_) => _shops);

  StreamSink<Shop> get shopAppendSink => _shopAppendingController.sink;

  StreamSink<List<Shop>> get shopsUpdatingSink => _shopsController.sink;

  void dispose() {
    _shopsController.close();
    _shopAppendingController.close();
  }
}
