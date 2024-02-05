import 'package:flutter/material.dart';
import 'package:saber/api_home.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: apiHome(),
    );
  }
}
