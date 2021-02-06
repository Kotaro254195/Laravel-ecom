import 'package:flutter_app/models/map_model.dart';
import 'package:flutter_app/models/shops_model.dart';

class AppModel {
  const AppModel({this.mapModel, this.shopsModel});

  final MapModel mapModel;
  final ShopsModel shopsModel;

  void dispose() {
    mapModel.dispose();
    shopsModel.dispose();
  }
}
