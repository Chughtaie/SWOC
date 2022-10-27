import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': 'AIzaSyC26Zicx2MHp577l_38TiDlhbNvaX8EU5c',
      },
    );

    // Check if response is successful
    if (response.statusCode == 200 && response.data['routes'] != []) {
      print(response.data);
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
