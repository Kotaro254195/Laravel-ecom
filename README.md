##●Usage
はじめに
$ flutter pub get
してください。もしエラーが出る場合はpubspec.yamlファイルの確認、もしくは
$ flutter channel master
でマスターに変更してからpub getしてみてください。

##●構成について

・main.dart
・HomePage.dart
・MapPage.dart
・DetailsPage.dart

 1.main.dart
  ヘッダーとフッターがあり、フッターのボタン押下によってindex変数を変更、それに伴いBodyのWidget、ヘッダーの文字を変更させています。
　また、APIへのデータのアクセス、取得はここで行っています。APIができ次第、コメントアウトしてある部分を書き換えようと思います。現在はデモデータを入れて動作確認しています。

 2.HomePage.dart
　お店の一覧を表示します。お店のデータはmain.dartから引数として取得しています。
　リストのアイテムを押すとDetailsPage.dartに移ります。

 3.MapPage.dart
　お店の一覧を地図上で表示します。お店のデータはmain.dartから引数として取得しています。
　マーカーをタップするとDetailsPage.dartに移ります。

 4.DetailsPage.dart
　お店の詳細情報を表示します。お店のデータはHomePage.dart,MapPage.dartから引数として取得しています。

##●備考
・MapPage.dartでは現在地をgeolocaterで現在地座標を取得してそれをGoogleMapのinitialCameraPositionのtargetに代入しています。
私が書いたコードだとgeolocaterでの現在地座標の取得がGoogleMapの表示より遅いためエラーが出るので、無理やりmain.dartのErrorWidgetで処理しています。(説明下手でごめんなさい)
もし何かいい案があれば直してください...

・コードが汚いのでどんどん変更していただければ幸いです。
