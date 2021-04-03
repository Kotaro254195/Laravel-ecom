import 'package:flutter_app/api/endpoint_types.dart';

// NOTE: ↓ 各自で切り替えてください
const baseUrl = 'https://omisesearch.herokuapp.com';

Map<EndpointTypes, String> get endPoints => {
      EndpointTypes.FETCH_RESTAURANT:
          '$baseUrl/api/v1.0/restaurant?lat=35.669220&lng=139.761457',
      EndpointTypes.FETCH_TWITTER:
          '$baseUrl/api/v1.0/gettweet?lat=35.669220&lng=139.761457&area=5km'
    };
