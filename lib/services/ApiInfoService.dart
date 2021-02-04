import 'package:flutter_app/api/EndpointTypes.dart';

final _BASE_URL = "http://192.168.20.92:8080";

// ignore: non_constant_identifier_names
Map<EndpointTypes, String> get EndPoints => {
      EndpointTypes.FETCH_RESTAURANT:
          _BASE_URL + "/api/v1.0/restaurant?lat=35.669220&lng=139.761457"
    };
