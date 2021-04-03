import 'package:flutter/material.dart';
import 'package:flutter_app/pages/details_page.dart';
import 'package:flutter_app/types/result.dart';
import 'package:flutter_app/types/shop.dart';

class ShopItem extends StatelessWidget {
  const ShopItem({this.shop});

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (context) => DetailsPage(shop: shop)));
        },
        child: Padding(
          child: Text(shop.name),
          padding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
