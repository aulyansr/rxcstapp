import 'package:flutter/material.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/splash/views/splash_screen.dart';
import 'package:rx_customer/service_locator.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  SetupServiceLocator();
  timeago.setLocaleMessages('id', timeago.IdMessages());
  timeago.setDefaultLocale('id');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppStyles.primaryColor,
          scaffoldBackgroundColor: AppStyles.whiteColor),
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
