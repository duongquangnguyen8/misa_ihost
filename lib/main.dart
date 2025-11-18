import 'package:flutter/material.dart';
import 'dependency_injection/service_locator.dart';
import 'route/router.dart';
import 'route/route_paths.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //tạo di cho toàn app
  await initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Misa iHos',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: RoutePaths.login,
      routes: AppRouter.routes,
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
