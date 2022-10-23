import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:swoc/component/app_bar.dart';
import 'package:swoc/component/main_drawer.dart';
import 'package:swoc/component/text_button.dart';
import 'package:swoc/shared/global.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/google_maps.dart';
import '../services/location_with map.dart';

class IconButtonData {
  String? label;
  IconData? iconData;
  Function? onTap;

  IconButtonData(
      {this.iconData = Icons.ac_unit_rounded,
      this.label = 'label',
      this.onTap});
}

class Home extends StatelessWidget {
  static const id = 'Home';
  Home({Key? key}) : super(key: key);

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primeColor,
        appBar: const KAppBar(
          title: 'Dashboard',
          profile: true,
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Padding(
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
                      TopHeading(label: 'Collected ', label1: '10'),
                      TopHeading(label: 'Remaining ', label1: '5')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => MapScreen())));
                  },
                  child: Image.asset(
                    'assets/images/map.png',
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    KTextButton(
                        label: 'Bin Collected Successfully', textSize: 22),
                  ],
                ),
                const KTextButton(
                  label: 'Report a Problem',
                  boxColor: Colors.grey,
                ),
              ],
            ),
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
