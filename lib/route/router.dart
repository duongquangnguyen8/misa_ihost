import 'package:flutter/material.dart';
import 'package:misa_ihost/pages/confirm_otp_page/confirm_otp_page.dart';
import 'package:misa_ihost/pages/intro/intro_page.dart';
import 'package:misa_ihost/pages/login_page/login_page.dart';
import 'package:misa_ihost/pages/splash/splash_page.dart';
import '../pages/home_page/home_page.dart';
import 'route_paths.dart';

class AppRouter {
  AppRouter._();

  static Map<String, WidgetBuilder> routes = {
    RoutePaths.splash: (_) => const SplashPage(),
    RoutePaths.intro: (_) => const IntroPage(name: ''),
    RoutePaths.login: (_) => LoginPage(),
    RoutePaths.home: (_) => HomePage(),
    RoutePaths.confirmOtp: (_) => const ConfirmOtpPage(),
    // RoutePaths.login: (_) => const LoginPage(),
    // RoutePaths.profile: (_) => const ProfilePage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
          settings: settings,
        );
      case RoutePaths.intro:
        return MaterialPageRoute(
          builder: (_) => IntroPage(name: args['name']),
          settings: settings,
        );
      case RoutePaths.login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: settings,
        );
      case RoutePaths.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings,
        );
      case RoutePaths.confirmOtp:
        return MaterialPageRoute(
          builder: (_) => ConfirmOtpPage(),
          settings: settings,
        );
      default:
        final builder = routes[settings.name];
        if (builder != null) {
          return MaterialPageRoute(builder: builder, settings: settings);
        }
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}

// Minimal placeholder pages. Replace these with your real pages.
