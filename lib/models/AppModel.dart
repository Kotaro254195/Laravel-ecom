import 'package:flutter_app/models/MapModel.dart';
import 'package:flutter_app/models/ShopsModel.dart';

class AppModel {
  final MapModel mapModel;
  final ShopsModel shopsModel;

  AppModel({this.mapModel, this.shopsModel});

  void dispose() {
    mapModel.dispose();
    shopsModel.dispose();
  }
}
