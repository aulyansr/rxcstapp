import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_customer/components/location_permission_component.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/order/views/order_screen.dart';

class OutletListScreen extends StatefulWidget {
  const OutletListScreen({super.key});

  @override
  State<OutletListScreen> createState() => _OutletListScreenState();
}

class OutletData {
  String id;
  String name;
  String location;
  Double? latitude;
  Double? longitude;
  TimeOfDay time_open;
  TimeOfDay time_close;
  List<String>? image;
  OutletData(
      {required this.id,
      required this.name,
      required this.location,
      required this.time_open,
      required this.time_close,
      this.latitude,
      this.longitude,
      this.image});
}

class _OutletListScreenState extends State<OutletListScreen> {
  final List<OutletData> _data = [
    OutletData(
        id: '1',
        name: 'Food Plaza PIK',
        location: 'Jakarta Utara',
        time_open: TimeOfDay(hour: 09, minute: 00),
        time_close: TimeOfDay(hour: 22, minute: 00),
        image: [
          'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/LULUR.jpg',
          'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/face-therapy.png',
          'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/reflexy-rx.png'
        ]),
    OutletData(
        id: '2',
        name: 'Pusat Grosir Cililitan',
        location: 'Jakarta Timur',
        time_open: TimeOfDay(hour: 09, minute: 00),
        time_close: TimeOfDay(hour: 22, minute: 00),
        image: null)
  ];
  final List<String> treatmentList = [
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/LULUR.jpg',
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/face-therapy.png',
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/reflexy-rx.png'
  ];

  @override
  void initState() {
    _requestLocationPermission();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _requestLocationPermission();
    });
  }

  @override
  Widget build(BuildContext context) {
    final EasyInfiniteDateTimelineController _controller =
        EasyInfiniteDateTimelineController();
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F7),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: AppStyles.whiteColor,
              toolbarHeight: 100,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  )),
              title: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Outlet',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppStyles.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Outlet akan otomatis diarahkan ke tempat terdekat tapi kamu tetap bisa reservasi di semua outlet',
                      maxLines: 2,
                      style: TextStyle(fontSize: 12, color: Color(0xFF808083)),
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(30),
              sliver: SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari Outlet',
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Color(0xFFFFFFFF),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFFB9C0C9),
                                  style: BorderStyle.none),
                              borderRadius: BorderRadius.circular(7)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFFB9C0C9),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFFB9C0C9),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Container(
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: null,
                              child: Text("Terdekat"),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFF808083)),
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              onPressed: null,
                              child: Text("Filter"),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFF808083)),
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 30, right: 30),
              sliver: SliverList.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, idx) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppStyles.primaryColor),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 3.0,
                                spreadRadius: 2.0)
                          ]),
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _data[idx].name,
                                      style: TextStyle(
                                          color: AppStyles.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      '${_data[idx].location} - 1 km',
                                      style:
                                          TextStyle(color: Color(0xFF808083)),
                                    )
                                  ],
                                ),
                              ),
                              TextButton(
                                  onPressed: null,
                                  child: SvgPicture.asset(
                                      'assets/images/icon-link.svg')),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (_data[idx].image != null)
                            CarouselSlider.builder(
                                itemCount:
                                    (_data[idx].image?.length ?? 0 / 3).round(),
                                itemBuilder: (context, index, realIdx) {
                                  final int first = index * 3;
                                  final int second = first + 1;
                                  final int third = second + 1;
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children:
                                          [first, second, third].map((index) {
                                        return Expanded(
                                          child: Container(
                                            height: 130,
                                            margin: EdgeInsets.only(
                                                right: 5, left: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                    offset: Offset(0.0, 0.0),
                                                  )
                                                ]),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      height: 90,
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            _data[idx].image?[
                                                                    index] ??
                                                                '',
                                                        fit: BoxFit.cover,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        alignment:
                                                            Alignment.center,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList());
                                },
                                options: CarouselOptions(
                                  enableInfiniteScroll: false,
                                  height: 90,
                                  enlargeCenterPage: false,
                                  viewportFraction: 1,
                                )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 35,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: null,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(IconlyLight.time_circle),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                            '${DateFormat('HH:mm').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, _data[idx].time_open.hour, _data[idx].time_open.minute))} - ${DateFormat('HH:mm').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, _data[idx].time_close.hour, _data[idx].time_close.minute))} WIB')
                                      ],
                                    ),
                                    style: ButtonStyle(
                                        padding: WidgetStatePropertyAll(
                                            EdgeInsets.only(
                                                left: 10, right: 10)),
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0xFFF5F6F7)),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)))),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Icon(
                                    IconlyLight.location,
                                    color: Colors.red,
                                  ),
                                  style: ButtonStyle(
                                      padding: WidgetStatePropertyAll(
                                          EdgeInsets.only(left: 3, right: 3)),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Color(0xFFF5F6F7)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none),
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                TextButton(
                                  onPressed: null,
                                  child: Icon(
                                    IconlyLight.call,
                                    color: AppStyles.primaryColor,
                                  ),
                                  style: ButtonStyle(
                                      padding: WidgetStatePropertyAll(
                                          EdgeInsets.only(left: 3, right: 3)),
                                      backgroundColor: WidgetStatePropertyAll(
                                          Color(0xFFF5F6F7)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none),
                                              borderRadius:
                                                  BorderRadius.circular(10)))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(20))),
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      _data[idx].name,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppStyles
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              EasyInfiniteDateTimeLine(
                                                controller: _controller,
                                                showTimelineHeader: false,
                                                firstDate: DateTime.now(),
                                                focusDate: DateTime.now(),
                                                lastDate: DateTime.now()
                                                    .add(Duration(days: 7)),
                                                onDateChange: (selectedDate) {
                                                  setState(() {
                                                    // _focusDate = selectedDate;
                                                  });
                                                },
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              AspectRatio(
                                                aspectRatio: 2.0,
                                                child: Container(
                                                  width: double.infinity,
                                                  child: BarChart(BarChartData(
                                                      alignment: BarChartAlignment
                                                          .center,
                                                      titlesData: FlTitlesData(
                                                          show: true,
                                                          topTitles: AxisTitles(
                                                              sideTitles: SideTitles(
                                                                  showTitles:
                                                                      false)),
                                                          leftTitles: AxisTitles(
                                                              sideTitles:
                                                                  SideTitles(
                                                                      showTitles:
                                                                          false)),
                                                          rightTitles: AxisTitles(
                                                              sideTitles:
                                                                  SideTitles(
                                                                      showTitles:
                                                                          false)),
                                                          bottomTitles: AxisTitles(
                                                              sideTitles:
                                                                  SideTitles(
                                                                      showTitles:
                                                                          true))),
                                                      gridData: FlGridData(
                                                        show: false,
                                                      ),
                                                      borderData: FlBorderData(
                                                          border: Border(
                                                              bottom: BorderSide(
                                                                  color: AppStyles
                                                                      .mutedColor2,
                                                                  width: 2))),
                                                      barGroups: [
                                                        BarChartGroupData(
                                                            x: 1,
                                                            barRods: [
                                                              BarChartRodData(
                                                                  toY: 10,
                                                                  width: 15,
                                                                  color: Color(
                                                                      0xFFBCD78D))
                                                            ]),
                                                        BarChartGroupData(
                                                            x: 1,
                                                            barRods: [
                                                              BarChartRodData(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              5),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              5)),
                                                                  toY: 5,
                                                                  width: 15,
                                                                  color: Color(
                                                                      0xFFBCD78D))
                                                            ]),
                                                        BarChartGroupData(
                                                            x: 1,
                                                            barRods: [
                                                              BarChartRodData(
                                                                  toY: 13,
                                                                  width: 15,
                                                                  color: Color(
                                                                      0xFFBCD78D))
                                                            ]),
                                                        BarChartGroupData(
                                                            x: 1,
                                                            barRods: [
                                                              BarChartRodData(
                                                                  toY: 8,
                                                                  width: 15,
                                                                  color: Color(
                                                                      0xFFBCD78D))
                                                            ]),
                                                      ])),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const OrderScreen()),
                                                      );
                                                    },
                                                    style: ButtonStyle(
                                                        shape: WidgetStatePropertyAll(
                                                            RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    width: 0,
                                                                    style: BorderStyle
                                                                        .none),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10))),
                                                        backgroundColor:
                                                            WidgetStatePropertyAll(
                                                                AppStyles
                                                                    .primaryColor)),
                                                    child: Text(
                                                      "Pesan",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Pesan",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none),
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppStyles.primaryColor)),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: PreferredSize(
    //     preferredSize: Size.fromHeight(80),
    //     child: AppBar(
    //       backgroundColor: Colors.white,
    //       surfaceTintColor: AppStyles.whiteColor,
    //       leading: IconButton(
    //           onPressed: () => Navigator.pop(context),
    //           padding: const EdgeInsets.only(left: 30, right: 30),
    //           icon: Icon(
    //             Icons.arrow_back_rounded,
    //             color: Colors.black,
    //           )),
    //       title: Container(
    //         padding: EdgeInsets.only(top: 20, bottom: 20),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               'Outlet',
    //               style: TextStyle(
    //                   fontSize: 24,
    //                   color: AppStyles.primaryColor,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               'Outlet akan otomatis diarahkan ke tempat terdekat tapi kamu tetap bisa reservasi di semua outlet',
    //               maxLines: 2,
    //               style: TextStyle(fontSize: 12, color: Color(0xFF808083)),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.only(left: 30, right: 30),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SizedBox(
    //             height: 10,
    //           ),
    //           TextField(
    //             decoration: InputDecoration(
    //               hintText: 'Cari Outlet',
    //               prefixIcon: Icon(Icons.search),
    //               filled: true,
    //               fillColor: Color(0xFFFFFFFF),
    //               border: OutlineInputBorder(
    //                   borderSide: BorderSide(
    //                       width: 1,
    //                       color: Color(0xFFB9C0C9),
    //                       style: BorderStyle.none),
    //                   borderRadius: BorderRadius.circular(7)),
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(
    //                   width: 1,
    //                   color: Color(0xFFB9C0C9),
    //                 ),
    //                 borderRadius: BorderRadius.circular(7),
    //               ),
    //               enabledBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(
    //                   width: 1,
    //                   color: Color(0xFFB9C0C9),
    //                 ),
    //                 borderRadius: BorderRadius.circular(7),
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 30,
    //           ),
    //           Container(
    //             child: Row(
    //               children: [
    //                 ElevatedButton(
    //                   onPressed: null,
    //                   child: Text("Terdekat"),
    //                   style: ButtonStyle(
    //                       backgroundColor: WidgetStatePropertyAll(Colors.white),
    //                       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    //                           side: BorderSide(color: Color(0xFF808083)),
    //                           borderRadius: BorderRadius.circular(10)))),
    //                 ),
    //                 SizedBox(
    //                   width: 20,
    //                 ),
    //                 ElevatedButton(
    //                   onPressed: null,
    //                   child: Text("Filter"),
    //                   style: ButtonStyle(
    //                       backgroundColor: WidgetStatePropertyAll(Colors.white),
    //                       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    //                           side: BorderSide(color: Color(0xFF808083)),
    //                           borderRadius: BorderRadius.circular(10)))),
    //                 )
    //               ],
    //             ),
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           Text(
    //             '3 outlet ditemukan berdasarkan jarak terdekat',
    //             style: TextStyle(color: Color(0xFF808083)),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           ListView.builder(
    //               shrinkWrap: true,
    //               physics: NeverScrollableScrollPhysics(),
    //               itemCount: 3,
    //               itemBuilder: (context, idx) {
    //                 return Container(
    //                   decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.circular(7),
    //                       boxShadow: [
    //                         BoxShadow(
    //                             color: Colors.black.withOpacity(0.1),
    //                             blurRadius: 3.0,
    //                             spreadRadius: 2.0)
    //                       ]),
    //                   margin: EdgeInsets.only(bottom: 10),
    //                   padding: EdgeInsets.all(10),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           Expanded(
    //                             child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text(
    //                                   'Food Plaza PIK',
    //                                   style: TextStyle(
    //                                       color: AppStyles.primaryColor,
    //                                       fontWeight: FontWeight.bold,
    //                                       fontSize: 16),
    //                                 ),
    //                                 Text(
    //                                   'Jakarta Utara - 1 km',
    //                                   style:
    //                                       TextStyle(color: Color(0xFF808083)),
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                           TextButton(
    //                               onPressed: null,
    //                               child: SvgPicture.asset(
    //                                   'assets/images/icon-link.svg')),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 10,
    //                       ),
    //                       CarouselSlider.builder(
    //                           itemCount: (treatmentList.length / 3).round(),
    //                           itemBuilder: (context, index, realIdx) {
    //                             final int first = index * 3;
    //                             final int second = first + 1;
    //                             final int third = second + 1;
    //                             return Row(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [first, second, third].map((idx) {
    //                                   return Expanded(
    //                                     child: Container(
    //                                       height: 130,
    //                                       margin: EdgeInsets.only(
    //                                           right: 5, left: 5),
    //                                       decoration: BoxDecoration(
    //                                           color: Colors.white,
    //                                           borderRadius: BorderRadius.all(
    //                                               Radius.circular(10)),
    //                                           boxShadow: [
    //                                             BoxShadow(
    //                                               color: Colors.black
    //                                                   .withOpacity(0.2),
    //                                               blurRadius: 1.0,
    //                                               spreadRadius: 1.0,
    //                                               offset: Offset(0.0, 0.0),
    //                                             )
    //                                           ]),
    //                                       child: ClipRRect(
    //                                         borderRadius: BorderRadius.all(
    //                                             Radius.circular(10)),
    //                                         child: Column(
    //                                           children: [
    //                                             Container(
    //                                                 height: 90,
    //                                                 child: CachedNetworkImage(
    //                                                   imageUrl:
    //                                                       treatmentList[idx],
    //                                                   fit: BoxFit.cover,
    //                                                   width: double.infinity,
    //                                                   height: double.infinity,
    //                                                   alignment:
    //                                                       Alignment.center,
    //                                                 ))
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   );
    //                                 }).toList());
    //                           },
    //                           options: CarouselOptions(
    //                             enableInfiniteScroll: false,
    //                             height: 90,
    //                             enlargeCenterPage: false,
    //                             viewportFraction: 1,
    //                           )),
    //                       SizedBox(
    //                         height: 10,
    //                       ),
    //                       Container(
    //                         height: 35,
    //                         child: Row(
    //                           children: [
    //                             TextButton(
    //                               onPressed: null,
    //                               child: Text('Tersedia'),
    //                               style: ButtonStyle(
    //                                   padding: WidgetStatePropertyAll(
    //                                       EdgeInsets.only(left: 10, right: 10)),
    //                                   backgroundColor: WidgetStatePropertyAll(
    //                                       Color(0xFFE8F3D5)),
    //                                   shape: WidgetStatePropertyAll(
    //                                       RoundedRectangleBorder(
    //                                           side: BorderSide(
    //                                               color:
    //                                                   AppStyles.primaryColor),
    //                                           borderRadius:
    //                                               BorderRadius.circular(10)))),
    //                             ),
    //                             SizedBox(
    //                               width: 5,
    //                             ),
    //                             Expanded(
    //                               child: TextButton(
    //                                 onPressed: null,
    //                                 child: Row(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.center,
    //                                   children: [
    //                                     Icon(IconlyLight.time_circle),
    //                                     SizedBox(
    //                                       width: 5,
    //                                     ),
    //                                     Text('10.00 - 22.00 WIB')
    //                                   ],
    //                                 ),
    //                                 style: ButtonStyle(
    //                                     padding: WidgetStatePropertyAll(
    //                                         EdgeInsets.only(
    //                                             left: 10, right: 10)),
    //                                     backgroundColor: WidgetStatePropertyAll(
    //                                         Color(0xFFF5F6F7)),
    //                                     shape: WidgetStatePropertyAll(
    //                                         RoundedRectangleBorder(
    //                                             side: BorderSide(
    //                                                 width: 0,
    //                                                 style: BorderStyle.none),
    //                                             borderRadius:
    //                                                 BorderRadius.circular(
    //                                                     10)))),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               width: 5,
    //                             ),
    //                             TextButton(
    //                               onPressed: null,
    //                               child: Icon(IconlyLight.location),
    //                               style: ButtonStyle(
    //                                   padding: WidgetStatePropertyAll(
    //                                       EdgeInsets.only(left: 10, right: 10)),
    //                                   backgroundColor: WidgetStatePropertyAll(
    //                                       Color(0xFFF5F6F7)),
    //                                   shape: WidgetStatePropertyAll(
    //                                       RoundedRectangleBorder(
    //                                           side: BorderSide(
    //                                               width: 0,
    //                                               style: BorderStyle.none),
    //                                           borderRadius:
    //                                               BorderRadius.circular(10)))),
    //                             ),
    //                           ],
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 );
    //               }),
    //         ],
    //       ),
    //     ),
    //   ),
    //   backgroundColor: Color(0xFFF5F6F7),
    // );
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }
}
