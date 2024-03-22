import 'package:flutter/material.dart';
import 'package:vtuberlist/core/utils/injections.dart';
import 'package:vtuberlist/core/router/router_name.dart';
import 'package:vtuberlist/core/router/router.dart';
import 'package:vtuberlist/feature/landing/view/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouterName.LandingPageName,
      onGenerateRoute: APPRouter.generateRoute,
      home: const LandingPage(),
    );
  }
}