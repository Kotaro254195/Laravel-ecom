import 'package:flutter/material.dart';
import 'package:flutter_app/models/AppModel.dart';
import 'package:flutter_app/models/MapModel.dart';
import 'package:flutter_app/models/ShopsModel.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/MapPage.dart';
import 'package:provider/provider.dart';

import 'types/Shop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
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
  List<String> barTitles = ["HOME", "MAP"]; //ヘッダーの文字

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  //例外処理＝Google Map 読み込み中の処理
  Widget build(BuildContext context) {
    final List<Widget> _pageList = [
      HomePage(),
      MapPage(),
    ];

    return Provider<AppModel>(
      create: (context) {
        // NOTE: ここでModelの初期化を行う
        return AppModel(mapModel: MapModel(), shopsModel: ShopsModel());
      },
      dispose: (context, model) => model.dispose(),
      child: Scaffold(
        body: _pageList.elementAt(_selectedIndex),
        appBar: AppBar(
          title: Text(barTitles[_selectedIndex]),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          elevation: 0.0,
        ),

        //フッター
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: 'MAP',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
