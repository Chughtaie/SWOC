import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swoc/component/app_bar.dart';
import 'package:swoc/component/main_drawer.dart';
import 'package:swoc/component/text_button.dart';
import 'package:swoc/shared/global.dart';
import '../services/location_with_map.dart';
import '../services/location_with_map_container.dart';

class IconButtonData {
  String? label;
  IconData? iconData;
  Function? onTap;

  IconButtonData(
      {this.iconData = Icons.ac_unit_rounded,
      this.label = 'label',
      this.onTap});
}

class CurrentRide extends StatelessWidget {
  static const id = 'CurrentRide';
  CurrentRide({Key? key}) : super(key: key);

  final Map<String, double> dataMap = {'A': 1, 'B': 2, 'C': 3, 'D': 4};
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: primeColor,
        appBar: const KAppBar(
          title: 'Current Ride',
          profile: false,
        ),
        drawer: MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
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

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    TopHeading(label: 'Total Bins ', label1: '10'),
                    TopHeading(label: 'Remaining ', label1: '5')
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  height: height * (3 / 4),
                  width: width,
                  child: MapScreenContainer(),
                ),
              ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: const [
              //     KTextButton(label: 'Current Ride', textSize: 22),
              //     KTextButton(label: 'Ride History', textSize: 22),
              //   ],
              // ),
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
      decoration: BoxDecoration(
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
