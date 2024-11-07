import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../res/app_styles.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "Notifikasi",
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
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Icon(
                                        IconlyBold.notification,
                                        color: AppStyles.primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Update Penting",
                                              style: TextStyle(
                                                color: AppStyles.primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              "Berisi update penting seperti pengingat treatment,pengingat waktu booking dll.",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.visible,
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Icon(
                                        IconlyBold.volume_down,
                                        color: AppStyles.primaryColor,
                                        size: 30,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Promo dan lainnya",
                                              style: TextStyle(
                                                color: AppStyles.primaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              "Nonaktifkan notifikasi untuk promo dan voucher.Tetapi kamu masih bisa cek semuanya di inbox",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.visible,
                                              softWrap: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Switch(
                                        value: true,
                                        onChanged: (value) {
                                          value = !value;
                                        },
                                        activeColor: AppStyles.primaryColor,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
