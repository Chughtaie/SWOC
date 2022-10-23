import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swoc/shared/global.dart';

class DrawerTileData {
  String name;
  IconData icon;
  Function()? onTap;
  DrawerTileData(
      {this.name = 'label', this.icon = Icons.translate_sharp, this.onTap});
}

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);
  final List<DrawerTileData> drawerData = [
    DrawerTileData(icon: Icons.fire_truck, name: 'Previous Rides'),
    DrawerTileData(icon: Icons.star_border_outlined, name: 'Rating'),
    DrawerTileData(icon: Icons.currency_bitcoin_rounded, name: 'Points'),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondColor,
      child: Column(
        children: <Widget>[
              Container(
                color: Color.fromARGB(255, 231, 225, 225),
                padding: EdgeInsets.only(bottom: 15.0, left: 20, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'SWOC',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(
                height: 2,
                color: primeColor,
              )
            ] +
            drawerData
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                e.icon,
                                size: 30,
                                color: primeColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  e.name,
                                  style: const TextStyle(
                                      fontSize: 20, color: primeColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: primeColor,
                          height: 2,
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
