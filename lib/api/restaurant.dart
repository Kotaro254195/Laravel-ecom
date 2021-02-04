import 'package:flutter_app/services/ApiInfoService.dart';
import 'package:http/http.dart' as http;

import 'EndpointTypes.dart';

Stream<http.Response> requestRestaurants() =>
    http.get(EndPoints[EndpointTypes.FETCH_RESTAURANT]).asStream();
