import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_app/MapPage.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/DetailsPage.dart';
import 'package:geolocator/geolocator.dart';

class Shop{
  Shop({
    this.name,
    this.evaluation,
    this.telephone,
    this.coordinate,
    this.congestion
  });

  final String name;
  final double evaluation;
  final String telephone;
  final List<double> coordinate;
  final double congestion;
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  List<Shop> _shops = <Shop>[];

  //apiからJsonデータ取得、加工部分　参考：https://eh-career.com/engineerhub/entry/2019/08/06/103000
  // Future<void> _load() async {
  //   final res = await http.get('https://api.github.com/repositories/31792824/issues');
  //   final data = json.decode(res.body);
  //   setState(() {
  //     // _data=res.body;
  //     final shops = data as List;
  //     shops.forEach((dynamic element) {
  //       final shop = element as Map;
  //       _shops.add(Shop(
  //         name:shop['name'] as String,
  //         evaluation: shop['evaluation'] as Float,
  //         telephone: shop['telephone'] as String,
  //         coordinate: shop['coordinate'] as List<double>,
  //         congestion: shop['congestion'] as Float
  //       ));
  //     });
  //   });
  // }


  int _selectedIndex = 0;
  List<String> BarTitles = ["HOME", "MAP"];//ヘッダーの文字

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

    @override
    //例外処理＝Google Map 読み込み中の処理
    Widget build(BuildContext context) {

      ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
        return getErrorWidget(errorDetails);
      };

      //デモデータ
      _shops=[
        Shop(name: 'マクドナルド',evaluation: 4.4,telephone: '01201234567',coordinate: [37.03146701139306, 140.89013741073236],congestion: 50.1),
        Shop(name: 'ケンタッキー',evaluation: 2,telephone: '01209999999',coordinate: [37.032489787517584, 140.8893454202752],congestion: 25.1),
        Shop(name: 'モスバーガー',evaluation: 3.5,telephone: '01209876543',coordinate: [37.032489787517777, 140.8893454202777],congestion: 32.1)
      ];

      return new Scaffold(
        body: [HomePage(shops: _shops,), MapPage(shops: _shops,)][_selectedIndex],

        appBar: AppBar(
          title: Text(BarTitles[_selectedIndex]),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          elevation: 0.0,
        ),

        //フッター
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              title: Text('MAP'),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      );
    }
//例外処理＝Google Map 読み込み中の処理
  Widget getErrorWidget(FlutterErrorDetails error) {
    return new Scaffold(
      body: Center(
          child:Text("読み込み中・・・")
      )
    );
  }
}
