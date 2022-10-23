import 'package:flutter/material.dart';
import 'package:swoc/shared/global.dart';

class KTextButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Color boxColor;
  final double textSize;
  final double horPad;
  const KTextButton({
    this.label = 'label',
    this.onTap,
    this.boxColor = secondColor,
    this.textSize = 18,
    this.horPad = 20,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: horPad),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: boxColor),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: textSize),
        ),
      ),
    );
  }
}
