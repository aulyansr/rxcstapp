import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:rx_customer/res/app_styles.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<bool> _typeOrder = [false, true];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {},
        child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: AppStyles.whiteColor,
                  toolbarHeight: 100,
                  floating: true,
                  pinned: true,
                  centerTitle: true,
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      )),
                  title: Text(
                    "Pesan Treatment",
                    style: TextStyle(
                        color: AppStyles.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFF5F6F7)),
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, right: 30, left: 30),
                  child: Row(
                    children: [
                      Icon(
                        IconlyLight.location,
                        color: AppStyles.primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Text(
                        "Food Plaza PIK",
                        style: TextStyle(
                            color: AppStyles.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(30),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Waktu Pemesanan",
                              style: TextStyle(
                                  color: AppStyles.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ToggleButtons(
                          fillColor: AppStyles.primaryColor,
                          selectedColor: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text("Pesan Sekarang"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text("Pesan untuk nanti"),
                            )
                          ],
                          isSelected: _typeOrder,
                          onPressed: (int idx) {
                            setState(() {
                              for (int i = 0; i < _typeOrder.length; i++) {
                                _typeOrder[i] = i == idx;
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
