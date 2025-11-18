import 'package:flutter/material.dart';

class AppNavigator {
  static Future navigate(
    BuildContext context,
    String route, {
    Map<String, dynamic>? arguments,
    bool isReplace = false,
  }) {
    if (isReplace) {
      return Navigator.pushReplacementNamed(
        context,
        route,
        arguments: arguments,
      );
    }

    return Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }
}