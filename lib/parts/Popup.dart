import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/app_model.dart';
import 'package:flutter_app/types/result.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Popup extends StatefulWidget {

  Popup({this.shops,this.selectedId});
  final List<Shop> shops;
  final int selectedId;

  @override
  _Popup createState() => _Popup(shops,selectedId);
}

class _Popup extends State<Popup> {
  List<Shop> shops;
  int selectedId;

  _Popup(List<Shop> shops,int selectedId){
    this.shops=shops;
    this.selectedId=selectedId;
  }

  @override
  Widget build(BuildContext context) {
    // return UpperPop(List<Shop> shops) {
    final TextStyle textStyle = TextStyle(fontSize: 20);
    final TextStyle textButtonStyle =
        TextStyle(fontSize: 20, color: Colors.blue);
    final Size displaySize = MediaQuery.of(context).size;

    //数値の評価→星マークに変換 ex.)evaluation:3→"★★★☆☆"
    String toStar(num evaluation) {
      String str = "";
      for (int i = 0; i < 5; i++) {
        if (i < evaluation)
          str += "★";
        else
          str += "☆";
      }
      return str;
    }

    //混雑度をメッセージを含むTextに変換
    Text describeNum(num congestion) {
      String message;
      if (congestion < 40)
        return Text("空いています",
            style: TextStyle(
                color: Colors.blue, fontSize: displaySize.width / 11));
      else if (congestion < 80)
        return Text("すこし混雑しています",
            style: TextStyle(
                color: Colors.yellow,
                backgroundColor: Colors.grey,
                fontSize: displaySize.width / 11));
      else
        return Text("混んでいます",
            style:
                TextStyle(color: Colors.red, fontSize: displaySize.width / 11));
    }

    return Dismissible(
        key: Key(shops[selectedId].name),
        direction: DismissDirection.down,
        // onDismissed: selectedId=null,
        child: Container(
            height: displaySize.height / 3,
            width: displaySize.width,
            color: Colors.white.withOpacity(0.8),
            margin: EdgeInsets.only(top: displaySize.height / 1.6),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Text(
                        selectedId == null
                            ? shops[0].name
                            : shops[selectedId].name,
                        style: TextStyle(fontSize: displaySize.width / 8),
                      ),
                      Text(selectedId == null
                          ? shops[0].name
                          : "評価:" + toStar(shops[selectedId].evaluation)),
                      Text(selectedId == null
                          ? shops[0].name
                          : "電話番号:" + shops[selectedId].telephone),
                      if (selectedId != null)
                        describeNum(shops[selectedId].congestion),
                    ],
                  )),
                ],
              ),
            )));
  }
}
