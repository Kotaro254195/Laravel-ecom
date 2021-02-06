import 'package:flutter/material.dart';
import 'package:flutter_app/components/shop_item.dart';
import 'package:flutter_app/models/AppModel.dart';
import 'package:flutter_app/types/Shop.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);

    return Scaffold(
        body: StreamBuilder<List<Shop>>(
      stream: appModel.shopsModel.shopsStream,
      initialData: appModel.shopsModel.currentShops.toList(),
      builder: (context, shopsSnapshot) {
        return shopsSnapshot.hasData
            ? ListView.builder(
                itemCount: shopsSnapshot.data.length,
                itemBuilder: (context, index) {
                  return ShopItem(
                    shop: shopsSnapshot.data.elementAt(index),
                  );
                },
              )
            : Center(
                child: Text("Loading..."),
              );
      },
    ));
  }
}
