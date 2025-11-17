import 'package:flutter/material.dart';
import 'package:misa_ihost/route/route_paths.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutePaths.intro,
              arguments: {'name': 'User'},
            );
          },
          child: Text('Splash Page'),
        ),
      ),
    );
  }
}
