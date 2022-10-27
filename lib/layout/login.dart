import 'package:flutter/material.dart';
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

  Color screenColor = secondColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: primeColor,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // const HeadingText(
                //   label: 'SWOC',
                //   letterSpacing: 2,
                // ),
                const HeadingText(
                  label: 'Smart Waste Management System',
                  letterSpacing: 0,
                  color: Colors.white,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                  height: MediaQuery.of(context).size.height * (180 / 925),
                ),
                // Lottie.asset(
                //   'assets/lotties/43435-truck-delivery.json',
                //   //width: screenSize.width * (700 / 925),
                //   repeat: true,
                //   reverse: false,
                //   animate: true,
                // ),
                Column(
                  children: user.keys
                          .map<Widget>(
                            (key) => (key != 'truck'
                                ? InputField(
                                    inputFieldData: InputFieldData(
                                        labelText: key,
                                        hint: user[key].toString(),
                                        color: Colors.white),
                                  )
                                : const SizedBox()),
                          )
                          .toList() +
                      [
                        KTextButton(
                          label: 'Login',
                          horPad: 30,
                          onTap: () {
                            Navigator.pushNamed(context, Home.id);
                          },
                        )
                      ],
                ),
              ],
            ),
          )),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String label;
  final double letterSpacing;
  final Color color;

  const HeadingText({
    Key? key,
    this.label = 'label',
    this.letterSpacing = 1.0,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 30,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
