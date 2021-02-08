import 'package:http/http.dart' as http;

import 'api_info.dart';
import 'endpoint_types.dart';

Stream<http.Response> requestRestaurants() =>
    http.get(endPoints[EndpointTypes.FETCH_RESTAURANT],
        headers: {'Content-Type': 'application/json'}).asStream();
