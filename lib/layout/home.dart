import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swoc/component/app_bar.dart';
import 'package:swoc/component/main_drawer.dart';
import 'package:swoc/component/text_button.dart';
import 'package:swoc/layout/current_ride.dart';
import 'package:swoc/provider/map_data_provider.dart';
import 'package:swoc/services/directions_api.dart';
import 'package:swoc/services/directions_model.dart';
import 'package:swoc/shared/global.dart';
import 'package:provider/provider.dart';

import '../provider/asset_provider.dart';

class IconButtonData {
  String? label;
  IconData? iconData;
  Function? onTap;

  IconButtonData(
      {this.iconData = Icons.ac_unit_rounded,
      this.label = 'label',
      this.onTap});
}

class Home extends StatefulWidget {
  static const id = 'Home';
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<String, double> dataMap = {'A': 1, 'B': 2, 'C': 3, 'D': 4};
  late Directions dirs;

  final List<Color> chartColors = [
    secondColor,
    Colors.yellow,
    primeColor,
    Colors.amber
  ];

  List<IconButtonData> iconData = [
    IconButtonData(
      iconData: Icons.fire_truck_outlined,
      label: 'Truck',
    ),
    IconButtonData(
      iconData: Icons.touch_app_outlined,
      label: 'Tap',
    ),
    IconButtonData(
      iconData: Icons.fire_truck,
      label: 'van',
    )
  ];

  late BitmapDescriptor binIcon;
  late BitmapDescriptor truckIcon;

  LatLng truckLocation = const LatLng(33.66743083384247, 73.00389228151198);
  List<LatLng> binLocations = const [
    LatLng(33.667395265223576, 72.99909392081224),
    LatLng(33.66804208771481, 72.9947221758802),
    LatLng(33.67053303137732, 72.99938712068705),
    LatLng(33.66890928261966, 73.00179310499149)
  ];

  //late List<LatLng> routes;
  addMarkers() async {
    Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId((-1).toString()),
        position: truckLocation,
        icon: truckIcon,
      ),
    );

    List.generate(
        binLocations.length,
        (index) => markers.add(
              Marker(
                markerId: MarkerId(index.toString()),
                position: binLocations[index],
                icon: binIcon,
              ),
            ));
    Provider.of<MapProvider>(context, listen: false).setMarkers(markers);
    await addPolylines();
  }

  addPolylines() async {
    late Set<Polyline> polylines;
    polylines = {};
    List.generate(
        Provider.of<MapProvider>(context, listen: false).routes.length - 1,
        (index) async {
      final directions = await DirectionsRepository().getDirections(
          origin:
              Provider.of<MapProvider>(context, listen: false).routes[index],
          destination: Provider.of<MapProvider>(context, listen: false)
              .routes[index + 1]);
      return polylines.add(
        Polyline(
          polylineId: PolylineId(index.toString()),
          color: Colors.primaries[Random().nextInt(
              Colors.primaries.length)], //ui.Color.fromARGB(255, 60, 244, 54),
          width: 3,
          points: directions.polylinePoints
              .map<LatLng>((e) => LatLng(e.latitude, e.longitude))
              .toList(),
        ),
      );
    });
    Provider.of<MapProvider>(context, listen: false).setPolyLines(polylines);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void customMarker() {
    Uint8List markerIcon;
    getBytesFromAsset('assets/images/bin.jpg', 60).then((response) {
      markerIcon = response;
      binIcon = BitmapDescriptor.fromBytes(markerIcon);
      Provider.of<AssetProvider>(context, listen: false).binIcon = binIcon;
    });

    getBytesFromAsset('assets/images/truck.png', 110).then((response) {
      markerIcon = response;
      truckIcon = BitmapDescriptor.fromBytes(markerIcon);
      Provider.of<AssetProvider>(context, listen: false).truckIcon = truckIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customMarker();
    Provider.of<MapProvider>(context, listen: false).routes =
        ([truckLocation] + binLocations);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primeColor,
        appBar: const KAppBar(
          title: 'SWOC',
          profile: true,
        ),
        drawer: MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // PieChart(
              //   dataMap: dataMap,
              //   chartType: ChartType.ring,
              //   ringStrokeWidth: 28,
              //   chartRadius: MediaQuery.of(context).size.width * (300 / 925),
              //   chartValuesOptions: const ChartValuesOptions(
              //     showChartValueBackground: false,
              //     showChartValues: false,
              //   ),
              //   colorList: chartColors,
              // ),
              //KTextButton()

              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: const [
              //       TopHeading(label: 'Total Rides ', label1: '10'),
              //       TopHeading(label: 'Remaining ', label1: '5')
              //     ],
              //   ),
              // ),
              // Container(
              //   height: 200,
              //   width: 300,
              //   child: MapScreenContainer(),
              // ),
              Image.asset('assets/images/homePageLogo.png'),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  KTextButton(
                    label: 'Current Ride',
                    textSize: 22,
                    onTap: () {
                      addMarkers();
                      Navigator.pushNamed(context, CurrentRide.id);
                    },
                  ),
                  const KTextButton(label: 'Ride History', textSize: 22),
                ],
              ),
              // const KTextButton(
              //   label: 'Report a Problem',
              //   boxColor: Colors.grey,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopHeading extends StatelessWidget {
  final String? label;
  final String? label1;
  const TopHeading({
    this.label = 'label',
    this.label1 = 'label1',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            //                   <--- left side
            color: secondColor,
            width: 3.0,
          ),
          bottom: BorderSide(
            //                    <--- top side
            color: secondColor,
            width: 3.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            label!,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          Text(
            label1!,
            style: const TextStyle(fontSize: 50, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
