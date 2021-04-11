# omise_searchApp

## Getting Start

### ライブラリの取得

```
$ flutter pub get
```

してください。もしエラーが出る場合は`pubspec.yaml`ファイルの確認、もしくは

```
$ flutter channel master
```

でマスターに変更してから pub get してみてください。

### API キーの適応

取得した GoogleMapsApi のキーを `android/app/src/main/AndroidManifest.xml` の `XXX` 部分に入れる。

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="XXXXXXXXXXXXXXXXXXXX" />
```

<details>
<summary>旧仕様</summary>

### freezed_annotationの適応
ターミナルで以下を適応
```shell script
 flutter pub run build_runner build --delete-conflicting-outputs
```

## ● 画面構成

```
・main.dart
・HomePage.dart
・MapPage.dart
・DetailsPage.dart
```

- 1.main.dart  
   ヘッダーとフッターがあり、フッターのボタン押下によって index 変数を変更、それに伴い Body の Widget、ヘッダーの文字を変更させています。  
  　また、API へのデータのアクセス、取得はここで行っています。API ができ次第、コメントアウトしてある部分を書き換えようと思います。現在はデモデータを入れて動作確認しています。

- 2.HomePage.dart  
  　お店の一覧を表示します。お店のデータは main.dart から引数として取得しています。  
  　リストのアイテムを押すと DetailsPage.dart に移ります。

- 3.MapPage.dart  
  　お店の一覧を地図上で表示します。お店のデータは main.dart から引数として取得しています。  
  　マーカーをタップすると DetailsPage.dart に移ります。

- 4.DetailsPage.dart  
  　お店の詳細情報を表示します。お店のデータは HomePage.dart,MapPage.dart から引数として取得しています。

## ● 備考

・MapPage.dart では現在地を geolocater で現在地座標を取得してそれを GoogleMap の initialCameraPosition の target に代入しています。  
私が書いたコードだと geolocater での現在地座標の取得が GoogleMap の表示より遅いためエラーが出るので、無理やり main.dart の ErrorWidget で処理しています。(説明下手でごめんなさい)  
もし何かいい案があれば直してください...

・コードが汚いのでどんどん変更していただければ幸いです。

</details>

## ディレクトリ構成

自己流なので、いろいろ口出ししてもらって OK です

```txt
lib
|- pages > アプリ上のページとなるWidget
|
|- components > ページ内で使われる部品（リストのアイテム、ボタンなど）のWidget
|
|- models > 状態管理（BLoC）*
|
|- api > APIに関する処理、機能（エンドポイントの定義やサーバへのリクエスト）
|
|- services > アプリで使うロジック。例：「現在地からお店データを取る」などといった処理
|
|- types > クラス、構造体など
|
|- main.dart > ルートWidget。全体的な設定、初期化などを書く。
```

### 状態管理（BLoC）について

BLoC の定義について  
https://nasust.com/flutter/8ad5b87a-91e2-482c-91ef-79ee5938e94c

`Stream` , `Sink` について知る必要があるみたいです。詳細は検索してもらえるといろいろ出ると思うので割愛。（ReactiveX 系ライブラリと似てるらしい）

BLoC の定義に沿って、以下のようなイメージで構築してます

#### View 側

- **View** は常に `Stream` を監視し、データが流れてきたら表示を更新する
- **View** から **Model** に対して操作が必要な場合は、 `Sink` に操作を要求する
- **View** は ロジックについて一切関与しない

#### Model 側

- `Sink` から値が流れてきたら、それを元にアプリの状態を更新する。
- 状態の更新後に `Stream` を流す

<img src="./readme assets/Androider App Structure.png">

🙇‍♂️ あまり BLoC について理解できてないので、細かい仕様については協力してくれるとありがたいです。
