import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/login/views/account_login_screen.dart';
import 'package:rx_customer/screens/register/views/account_register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'))),
            ),
            SizedBox(height: 20),
            Text(
              "Selamat Datang",
              style: TextStyle(
                  color: AppStyles.primaryColor,
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            Text("Silahkan login atau sign up untuk melanjutkan",
                style: TextStyle(
                  color: Color(0xFF808083),
                  fontSize: 12,
                )),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: SizedBox(
              height: 300,
              child: SvgPicture.asset(
                "assets/images/welcome.svg",
                fit: BoxFit.scaleDown,
              ),
            )),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, bottom: 30, left: 30, right: 30),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountLoginScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Masuk",
                          style: TextStyle(
                              color: AppStyles.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppStyles.primaryColor),
                        minimumSize:
                            WidgetStatePropertyAll(Size(double.infinity, 10)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                  ),
                  SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AccountRegisterScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Buat Akun",
                          style: TextStyle(
                              color: AppStyles.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppStyles.secondaryColor),
                        minimumSize:
                            WidgetStatePropertyAll(Size(double.infinity, 10)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
