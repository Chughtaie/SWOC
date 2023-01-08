import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AssetProvider extends ChangeNotifier {
  late BitmapDescriptor binIcon;
  late BitmapDescriptor truckIcon;
  late LatLng currentLocation;

  setLocation(LatLng source) {
    currentLocation = source;
    notifyListeners();
  }
}
