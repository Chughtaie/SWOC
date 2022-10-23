import 'package:flutter/material.dart';

class Dialing extends StatefulWidget {
  static const id = 'Dialing';
  const Dialing({Key? key}) : super(key: key);

  @override
  State<Dialing> createState() => _DialingState();
}

class _DialingState extends State<Dialing> {
  final List data = [1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'];
  final int rowSize = 3;
  String number = '';
  final Color color = const Color.fromARGB(255, 90, 162, 221);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Dialing')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      number,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (number != '')
                              number = number.substring(0, number.length - 1);
                          });
                        },
                        child: const Icon(Icons.cleaning_services_outlined))
                  ],
                )
              ] +
              List.generate(
                (data.length / rowSize).round(),
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    rowSize,
                    (index1) => GestureDetector(
                      onTap: () {
                        setState(() {
                          number +=
                              data[(index * rowSize) + (index1)].toString();
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: color,
                        ),
                        //width: MediaQuery.of(context).size.width / rowSize,
                        child: Center(
                          child: Text(
                            data[(index * rowSize) + (index1)].toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ) +
              [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 198, 197, 197),
                  ),
                  child: const Icon(
                    Icons.call,
                    color: Colors.green,
                    size: 50,
                  ),
                )
              ],
        ),
      ),
    );
  }
}
