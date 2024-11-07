import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../res/app_styles.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

class CsScreen extends StatefulWidget {
  const CsScreen({super.key});

  @override
  State<CsScreen> createState() => _CsScreenState();
}

class csData {
  final String phone_number;
  final String email;

  csData({required this.phone_number, required this.email});
}

class _CsScreenState extends State<CsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Pusat Bantuan",
              style: TextStyle(
                color: AppStyles.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              padding: const EdgeInsets.only(left: 20, right: 30),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child: Container(
                      child: Column(
                        children: [
                          Image.asset('assets/images/cs_woman.png'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(40),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: AppStyles.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "Selamat datang di Pusat Bantuan! Kami siap membantu kamu menemukan jawaban dan solusi yang diperlukan.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppStyles.blackPrimary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {
                                final url = Uri.parse(
                                    'https://wa.me/6281285545703?text=Hello');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  print('Could not launch $url');
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppStyles.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Adjusts row size to content
                                children: [
                                  Icon(
                                    IconlyBold
                                        .call, // Replace with IconlyBold.whatsapp if needed
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // Adds spacing between icon and text
                                  Text(
                                    "0812123313 (whatsapp)",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {
                                final email = Uri(
                                  scheme: 'mailto',
                                  path: 'support@relaxology.id',
                                );
                                if (await canLaunchUrl(email)) {
                                  await launchUrl(email);
                                } else {
                                  print('Could not launch $email');
                                }
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: AppStyles.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Adjusts row size to content
                                children: [
                                  Icon(
                                    IconlyBold
                                        .message, // Replace with IconlyBold.whatsapp if needed
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // Adds spacing between icon and text
                                  Text(
                                    "support@relaxology.id",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
