import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final String name;
  const IntroPage({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Intro Page')));
  }
}
