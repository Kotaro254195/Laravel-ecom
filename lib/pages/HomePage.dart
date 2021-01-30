import 'package:flutter/material.dart';
import 'package:flutter_app/types/Shop.dart';
import 'DetailsPage.dart';

class HomePage extends StatefulWidget {
  final List<Shop> shops;

  HomePage({this.shops});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.shops.length,
        itemBuilder: (context, index) {
          return Card(
            child: new InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsPage(shop: widget.shops[index])));
              },
              child: Padding(
                child: Text(widget.shops[index].name),
                padding: EdgeInsets.all(20.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
