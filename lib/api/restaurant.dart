import 'package:http/http.dart' as http;

import 'ApiInfo.dart';
import 'EndpointTypes.dart';

Stream<http.Response> requestRestaurants() =>
    http.get(EndPoints[EndpointTypes.FETCH_RESTAURANT],
        headers: {'Content-Type': 'application/json'}).asStream();
