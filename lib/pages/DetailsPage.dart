import 'package:flutter/material.dart';

import '../types/Shop.dart';

class DetailsPage extends StatefulWidget {
  final Shop shop;

  DetailsPage({this.shop});

  @override
  _DetailsPage createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("詳細"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text(widget.shop.name),
          Text('評価：' + widget.shop.evaluation.toString()),
          Text('電話番号：' + widget.shop.telephone),
          Text('混雑度：' + widget.shop.congestion.toString()),
        ],
      )),
    );
  }
}
