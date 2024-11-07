import 'package:flutter/material.dart';
import 'package:rx_customer/components/dashed_line.dart';
import 'package:rx_customer/res/app_styles.dart';

class ActivityDetailScreen extends StatefulWidget {
  const ActivityDetailScreen({super.key});

  @override
  State<ActivityDetailScreen> createState() => _ActivityDetailScreenState();
}

class _ActivityDetailScreenState extends State<ActivityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
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
                    "Dalam Proses",
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
                SliverPadding(
                  padding: EdgeInsets.all(30),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Image.asset('assets/images/icon-therapy-lg.png'),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 5,
                                      color: AppStyles.primaryColor,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 5,
                                      color: AppStyles.mutedColor,
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                width: MediaQuery.of(context).size.width - 60,
                                top: -12,
                                left: 0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color:
                                                        AppStyles.primaryColor,
                                                    width: 4,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppStyles.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Treatment Dikonfirmasi",
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.visible,
                                              style: TextStyle(
                                                  color:
                                                      AppStyles.primaryColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color:
                                                        AppStyles.primaryColor,
                                                    width: 4,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppStyles.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                            Text("Treatment Dalam Proses",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                    color:
                                                        AppStyles.primaryColor))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color:
                                                        AppStyles.primaryColor,
                                                    width: 4,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppStyles.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                            Text("Treatment Selesai",
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                    color:
                                                        AppStyles.primaryColor))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Row(
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              alignment: Alignment.topRight,
                              child: Chip(
                                  color:
                                      WidgetStatePropertyAll(Color(0xFF8BC543)),
                                  label: Text('Dalam Proses',
                                      style: TextStyle(color: Colors.white)),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Tanggal & Waktu',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text('20 Agustus 10:00',
                                        style: TextStyle(
                                            color: AppStyles.primaryColor))))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Outlet',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text('Food Plaza PIK',
                                        style: TextStyle(
                                            color: AppStyles.primaryColor))))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dedemy',
                                style: TextStyle(
                                    color: AppStyles.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: AppStyles.mutedColor))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('Body Massage',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text('60 Menit',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppStyles.mutedColor2,
                                            ))
                                      ])),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: AppStyles.mutedColor))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Additional',
                                            style: TextStyle(
                                                color: AppStyles.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text('-',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppStyles.mutedColor2,
                                            ))
                                      ])),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: AppStyles.mutedColor))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Terapis',
                                            style: TextStyle(
                                                color: AppStyles.primaryColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 48,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFD9D9D9),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 2,
                                                      color:
                                                          Color(0xFFD9D9D9))),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/images/noimage_therapist.png',
                                                  fit: BoxFit.cover,
                                                  width: 48,
                                                  height: 48,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "Fahmi",
                                                style: TextStyle(
                                                    color:
                                                        AppStyles.primaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        )
                                      ]))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ringkasan Pembayaran',
                                style: TextStyle(
                                    color: AppStyles.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: AppStyles.mutedColor))),
                                  child: Row(
                                    children: [
                                      Text('Total Treatment',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.topRight,
                                              child: Text('Rp. 170.000')))
                                    ],
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Text('Diskon',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.topRight,
                                              child: Text('-Rp. 34.000')))
                                    ],
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              width: 1,
                                              color: AppStyles.mutedColor))),
                                  child: Row(
                                    children: [
                                      Text('Total',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.topRight,
                                              child: Text('Rp. 136.000')))
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
        onRefresh: () async {});
  }
}
