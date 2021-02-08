import 'package:flutter_app/api/endpoint_types.dart';

// NOTE: ↓ 各自で切り替えてください
const baseUrl = 'http://192.168.20.92:8080';

Map<EndpointTypes, String> get endPoints => {
      EndpointTypes.FETCH_RESTAURANT:

      '$baseUrl/api/v1.0/restaurant?lat=35.669220&lng=139.761457'
};
