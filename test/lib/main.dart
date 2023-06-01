import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I'
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400,
    600,
    500,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    100,
    200,
    300,
    400
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            print("Thay đổi");
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }),
    );
  }
}
