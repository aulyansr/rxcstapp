import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/home/views/home_screen.dart';
import 'package:rx_customer/screens/onboarding/views/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () async {
      final storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');
      if (token == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OnboardingScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyles.primaryColor,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF056832), Color(0xFF6BB334)],
                transform: GradientRotation(60)),
          ),
          child: Center(
              child: Column(
            children: [
              Expanded(
                  child: Center(
                child: Container(
                  width: 108,
                  height: 108,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/logo.png'))),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  "#RelaxAjaDulu",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppStyles.whiteColor),
                ),
              )
            ],
          )),
        ));
  }
}
