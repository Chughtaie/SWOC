import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  late BitmapDescriptor binImage;
  late List<LatLng> routes;
  int binCollect = 0;

  setRoutes(List<LatLng> route) {
    routes = route;
    notifyListeners();
  }

  addMarker(Marker marker) {
    markers.add(marker);
    notifyListeners();
  }

  setMarkers(Set<Marker> source) {
    markers = source;
    notifyListeners();
  }

  addPolyline(Polyline polyline) {
    polylines.add(polyline);
    notifyListeners();
  }

  setPolyLines(Set<Polyline> source) {
    polylines = source;
    notifyListeners();
  }

  addBin() {
    binCollect += 1;
    notifyListeners();
  }
}
