import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:swoc/provider/map_data_provider.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapScreenContainer extends StatefulWidget {
  @override
  State<MapScreenContainer> createState() => MapScreenContainerState();
}

class MapScreenContainerState extends State<MapScreenContainer> {
  LatLng initPosition =
      LatLng(0, 0); //initial Position cannot assign null values
  LatLng currentLatLng = LatLng(
      0.0, 0.0); //initial currentPosition values cannot assign null values
  LocationPermission permission =
      LocationPermission.denied; //initial permission status
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    checkPermission();
    print(Provider.of<MapProvider>(context, listen: false).markers.toString());
  }

  //checkPersion before initialize the map
  void checkPermission() async {
    permission = await Geolocator.checkPermission();
  }

  getLocation() async {
    double lat, long;
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied)
        permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      long = position.longitude;
      return LatLng(lat, long);
      // ignore: non_constant_identifier_names
    } catch (E) {
      print(E);
    }
  }

  // get current location
  void getCurrentLocation() async {
    currentLatLng = await getLocation();
    setState(() {
      currentLatLng = currentLatLng;
    });
    // await Geolocator.getCurrentPosition().then((currLocation) {
    //   setState(() {
    //     currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
    //   });
    // });
  }

  //call this onPress floating action button
  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: currentLatLng,
        zoom: 12.0,
      ),
    ));
  }

  //Check permission status and currentPosition before render the map
  bool checkReady(LatLng? x, LocationPermission? y) {
    if (x == initPosition ||
        y == LocationPermission.denied ||
        y == LocationPermission.deniedForever) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(permission);
    print("Current Location --------> " +
        currentLatLng.latitude.toString() +
        " " +
        currentLatLng.longitude.toString());
    return checkReady(currentLatLng, permission)
        ? Center(child: CircularProgressIndicator())
        //Stack : place floating action button on top of the map
        : Stack(
            children: [
              GoogleMap(
                myLocationEnabled: false,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                markers: Provider.of<MapProvider>(context).markers,
                polylines: Provider.of<MapProvider>(context).polylines,
                initialCameraPosition: CameraPosition(target: currentLatLng),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              //Positioned : use to place button bottom right corner
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: FloatingActionButton(
                      onPressed: _currentLocation,
                      child: Icon(Icons.location_on)),
                ),
              ),
            ],
          );
  }
}
