import 'package:flutter/material.dart';

class InputFieldData {
  late String labelText;
  late String hint;
  late bool obscureText;
  late Color color;
  late bool incorrect;
  TextEditingController? userInput = TextEditingController();

  InputFieldData(
      {this.color = Colors.white,
      this.labelText = 'Label',
      this.hint = 'hint',
      this.obscureText = false,
      this.incorrect = false,
      this.userInput});

  InputFieldData.constt() {
    color = Colors.white;
    labelText = 'Label';
    hint = 'hint';
    obscureText = false;
    incorrect = false;
  }
  InputFieldData copyWith({Color? colors}) {
    color = colors!;
    return this;
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.inputFieldData,
    this.spacing = 10,
  }) : super(key: key);
  final InputFieldData inputFieldData;
  final double spacing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: TextFormField(
        controller: inputFieldData.userInput,
        obscureText: inputFieldData.obscureText,

        style: TextStyle(
          fontSize: 20,
          color: inputFieldData.color,
        ),

        // onChanged: (value) {
        //   // setState(() {
        //   //   //print(userInput.text + value);
        //   //   // userInput.text = value.toString();
        //   //  /*print();*/
        //   //  /*print();*/
        //   // });
        // },
        decoration: InputDecoration(
          // floatingLabelBehavior: FloatingLabelBehavior.al,

          focusColor: inputFieldData.color,

          //add prefix icon
          // prefixIcon: Icon(
          //   Icons.person_outline_rounded,
          //   color: Colors.grey,
          // ),

          //  errorText: "Error",

          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: inputFieldData.incorrect
                    ? Colors.red
                    : inputFieldData.color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: inputFieldData.incorrect
                    ? Colors.red
                    : inputFieldData.color),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: inputFieldData.incorrect
                    ? Colors.red
                    : inputFieldData.color),
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: Border.,
          // //  borderRadius: BorderRadius.circular(10.0),
          // ),
          fillColor: Colors.grey,
          contentPadding: const EdgeInsets.all(0),
          hintText: inputFieldData.hint,
          //make hint text
          hintStyle: TextStyle(
            color: inputFieldData.color,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),

          suffixText: inputFieldData.incorrect ? '!  ' : '',
          suffixStyle: const TextStyle(color: Colors.red),
          //create lable
          labelText: inputFieldData.labelText,
          //lable style
          labelStyle: TextStyle(
            color: inputFieldData.color,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
