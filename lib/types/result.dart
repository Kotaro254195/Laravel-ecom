import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.shop(T value) = ShopResult<T>;

  const factory Result.tweet(T value) = TweetResult<T>;
}

class Shop {
  Shop(
      {this.name,
      this.evaluation,
      this.telephone,
      this.latLng,
      this.congestion});

  factory Shop.formJson(Map<String, dynamic> json) {
    return Shop(
        name: json['name'] as String,
        evaluation: json['evaluation'] as num,
        telephone: json['telephone_number'] as String,
        congestion: json['congestion'] as num,
        latLng: LatLng(json['location']['lat'] as double,
            json['location']['lng'] as double));
  }

  final String name;
  final num evaluation;
  final String telephone;
  final LatLng latLng;
  final num congestion;

  @override
  String toString() {
    return '''
    Shop Instance > name: $name, evaluation: $evaluation, 
    phone: $telephone, congestion: $congestion, 
    latLng: ${latLng.latitude} ${latLng.longitude}
    ''';
  }
}

class Tweet {
  Tweet({
    this.latLng,
    this.fullText,
    this.placeName,
  });

  factory Tweet.formJson(Map<String, dynamic> json) {
    return Tweet(
        fullText: json['full_text'] as String,
        placeName: json['place_name'] as String,
        latLng: LatLng(json['coordinates']['lat'] as double,
            json['coordinates']['lng'] as double));
  }

  Map<String, String> toJson() {
    return {"name": this.fullText};
  }

  final LatLng latLng;
  final String fullText;
  final String placeName;
}
