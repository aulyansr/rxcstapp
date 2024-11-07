import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/activity/views/activity_detail_screen.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class ActivityData {
  String treatmentName;
  String status;
  double price;
  String paymentType;
  DateTime date;
  ActivityData(
      {required this.treatmentName,
      required this.status,
      required this.price,
      required this.paymentType,
      required this.date});
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<ActivityData> _data = [
    ActivityData(
        treatmentName: "Body Massage",
        status: "Process",
        price: 200000,
        paymentType: 'RX Wallet',
        date: DateTime(2024, 10, 30, 10, 30)),
    ActivityData(
        treatmentName: "Body Massage",
        status: "Process",
        price: 200000,
        paymentType: 'RX Wallet',
        date: DateTime(2024, 10, 30, 10, 30)),
  ];
  final List<String> _dataCategory = [
    "Treatment",
    "Dalam Proses",
    "Pesan untuk nanti"
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {},
        child: Scaffold(
            backgroundColor: Color(0xFFF5F6F7),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    "Aktivitas",
                    style: TextStyle(
                        color: AppStyles.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      )),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _dataCategory.length,
                        itemBuilder: (context, idx) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Chip(
                              backgroundColor: Colors.transparent,
                              label: Text(
                                _dataCategory[idx],
                                style: TextStyle(color: AppStyles.mutedColor2),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: AppStyles.mutedColor),
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          );
                        }),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(30),
                  sliver: SliverList.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, idx) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ActivityDetailScreen()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 5.0,
                                      spreadRadius: 2.0),
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                        'assets/images/icon-therapy-sm.png'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _data[idx].treatmentName,
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppStyles.primaryColor),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF8BC543),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Text(
                                          _data[idx].status,
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: Text(
                                        DateFormat('dd MMMM yyyy')
                                            .format(_data[idx].date),
                                        style: TextStyle(
                                            color: AppStyles.mutedColor2),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Rp. ${NumberFormat('#,##0').format(_data[idx].price)}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            _data[idx].paymentType,
                                            style: TextStyle(
                                                color: AppStyles.mutedColor2),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            )));
  }
}
