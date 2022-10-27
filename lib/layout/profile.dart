import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swoc/component/app_bar.dart';
import 'package:swoc/component/input_field.dart';
import 'package:swoc/shared/global.dart';

class User {
  String? name;
  String? userName;
  String? password;
  bool type = true;
  int? rating;
  int? points;
  Truck? truck;
}

class Truck {
  String? vehNo;
  double? capacity;
}

class Profile extends StatelessWidget {
  static const id = 'profile';
  Profile({Key? key}) : super(key: key);
  final Map<String, dynamic> user = {
    'name': 'Abdullah',
    'userNname': 'Abdullah007',
    'password': 'Abdullah123',
    'type': 'private',
    'rating': 3.5,
    'point': 40,
    'truck': {'vehNo': 'reg 453', 'capacity': 20.0}
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primeColor,
      appBar: const KAppBar(title: 'Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: const <Widget>[
                    Icon(Icons.account_circle_outlined,
                        color: Colors.white, size: 80)
                  ] +
                  user.keys
                      .map<Widget>(
                        (key) => (key != 'truck'
                            ? InputField(
                                inputFieldData: InputFieldData(
                                  labelText: key,
                                  hint: user[key].toString(),
                                  userInput: TextEditingController(
                                    text: user[key].toString(),
                                  ),
                                ),
                              )
                            : const SizedBox()),
                      )
                      .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
