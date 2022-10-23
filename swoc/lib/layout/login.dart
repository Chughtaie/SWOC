import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:swoc/component/input_field.dart';
import 'package:swoc/component/text_button.dart';
import 'package:swoc/layout/home.dart';
import 'package:swoc/shared/global.dart';

class Login extends StatelessWidget {
  static const id = 'Login';
  Login({Key? key}) : super(key: key);

  final Map<String, dynamic> user = {
    // 'Full Name': 'Abdullah',
    'User Name': 'Abdullah007',
    'Password': 'Abdullah123',
    //'Vehicle Type': 'private',
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: primeColor,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Smart Waste Management System',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: secondColor, fontSize: 30),
                  ),
                  Lottie.asset(
                    'assets/lotties/43435-truck-delivery.json',
                    //width: screenSize.width * (700 / 925),
                    repeat: true,
                    reverse: false,
                    animate: true,
                  ),
                  Column(
                    children: user.keys
                        .map<Widget>(
                          (key) => (key != 'truck'
                              ? InputField(
                                  inputFieldData: InputFieldData(
                                    labelText: key,
                                    hint: user[key].toString(),
                                  ),
                                )
                              : const SizedBox()),
                        )
                        .toList(),
                  ),
                  KTextButton(
                    label: 'Login',
                    horPad: 30,
                    onTap: () {
                      Navigator.pushNamed(context, Home.id);
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
