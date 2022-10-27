import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  late BitmapDescriptor binImage;

  setMarkers(Set<Marker> source) {
    markers = source;
    notifyListeners();
  }

  setPolyLines(Set<Polyline> source) {
    polylines = source;
    notifyListeners();
  }
}
