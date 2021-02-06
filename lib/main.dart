import 'package:flutter/material.dart';
import 'package:flutter_app/models/app_model.dart';
import 'package:flutter_app/models/map_model.dart';
import 'package:flutter_app/models/shops_model.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/map_page.dart';
import 'package:flutter_app/services/shops_service.dart';
import 'package:provider/provider.dart';

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
  int _selectedIndex = 0;
  List<String> barTitles = ['HOME', 'MAP']; //ヘッダーの文字

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _pageList = <Widget>[
      HomePage(),
      MapPage(),
    ];

    return Provider<AppModel>(
      create: (context) {
        final mapModel = MapModel();
        final shopsModel = ShopsModel();
        // NOTE: サーバを起動しているなら↓
        fetchRecommendationShops().listen(shopsModel.shopsUpdatingSink.add);
        // NOTE: 表示の確認のみで良いなら↓
        // fetchTestRecommendationShops().listen(shopsModel.shopsUpdatingSink.add);
        return AppModel(mapModel: mapModel, shopsModel: shopsModel);
      },
      dispose: (context, model) => model.dispose(),
      child: Scaffold(
        body: _pageList.elementAt(_selectedIndex),
        appBar: AppBar(
          title: Text(barTitles[_selectedIndex]),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          elevation: 0,
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
