import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DetailsPage.dart';
import 'package:flutter_app/types/Shop.dart';

class ShopItem extends StatelessWidget {
  final Shop shop;

  ShopItem({this.shop});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailsPage(shop: shop)));
        },
        child: Padding(
          child: Text(shop.name),
          padding: EdgeInsets.all(20.0),
        ),
      ),
    );
    ;
  }
}
