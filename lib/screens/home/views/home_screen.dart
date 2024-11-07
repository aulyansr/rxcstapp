import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rx_customer/components/bottom_navigation_component.dart';
import 'package:rx_customer/res/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sliderIndex = 0;
  final List<String> imgList = [
    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'

    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/early-treatment.jpeg',
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/early-treatment.jpeg',
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/early-treatment.jpeg',
  ];
  final List<String> treatmentList = [
    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/LULUR.jpg',
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/face-therapy.png',
    'https://relax.co.id/wp-content/themes/relaxology%20v7/assets/image/Treatment/reflexy-rx.png'
  ];
  final List<String> artikelList = [
    // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://lh4.googleusercontent.com/njkWuWR4jBPZAaLa_ShRqy1LBEN7RbeVu9Dzrjky0dYaBV7AgCh81ibfeMBZmKjgiB07hLKKRQpP1ajq70MSCtttyjRbiLTZ4s_Q4fLrdfEgfp5mctbhS7JYqJNN8-9eeQoOogI0O3M6iI_jnEOTYnZHWLeikyX5PBId24ITnOvrWAUgeE2pzl6pxA',
    'https://lh3.googleusercontent.com/9diQ3f1JLGBEROG4WMF3IBHz0D-OcymWUjE4bfSBexGMDNR1aiBFbcLw_Gyw4GafYMee577S8ZhxYV5GlW7kTA7NcDxDYWKJDWkj0C2K7OHBQqr79j6net8fnnpsfmptFrBxzZEBkJ-FWqrZp2Zlapt9wPGgxMh1oBYJ3fTwCX3ZNFh1Z8U60-vFRw'
  ];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        body: ListView(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(48),
                    bottomRight: Radius.circular(48),
                  ),
                  child: CarouselSlider.builder(
                    itemCount: imgList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      child: GestureDetector(
                        onTap: () {
                          print("tes");
                        },
                        child: CachedNetworkImage(
                            imageUrl: imgList[itemIndex],
                            fit: BoxFit.fitWidth,
                            width: double.infinity),
                      ),
                    ),
                    options: CarouselOptions(
                        height: 192,
                        autoPlay: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            sliderIndex = index;
                          });
                        }),
                  )),
              Positioned(
                  height: 100,
                  bottom: -60, // Set the overlap amount here
                  left: 16, // Optional: to center horizontally
                  right: 16,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari outlet terdekat',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Color(0xFFFFFFFF),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Color(0xFFB9C0C9),
                              style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFFB9C0C9),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xFFB9C0C9),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 50,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          imgList.length, (index) => generateDots(index))
                    ],
                  ))
            ]),
            SizedBox(height: 25),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF6BB334), Color(0xFF066937)]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 2, color: Color(0xFFD9D9D9))),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/noimage_user.png',
                                  fit: BoxFit.cover,
                                  width: 48,
                                  height: 48,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Ronald Putra Utama",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                        ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xFF6BB334)),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Top Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 12),
                                SvgPicture.asset(
                                    'assets/images/icon-wallet.svg')
                              ],
                            ))
                      ],
                    ))),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0),
                            ]),
                        child: Row(
                          children: [
                            Image.asset('assets/images/icon-saldo.png'),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Saldo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppStyles.primaryColor)),
                                  Text("Rp. 300.000",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppStyles.primaryColor))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0),
                            ]),
                        child: Row(
                          children: [
                            Image.asset('assets/images/icon-poin.png'),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Poin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppStyles.primaryColor)),
                                  Text("300.000",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: AppStyles.primaryColor))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Treatment untuk kamu',
                    style: TextStyle(
                        color: AppStyles.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  CarouselSlider.builder(
                      itemCount: (treatmentList.length / 3).round(),
                      itemBuilder: (context, index, realIdx) {
                        final int first = index * 3;
                        final int second = first + 1;
                        final int third = second + 1;
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [first, second, third].map((idx) {
                              return Expanded(
                                child: Container(
                                  height: 130,
                                  margin: EdgeInsets.only(right: 5, left: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(0.0, 0.0),
                                        )
                                      ]),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 90,
                                            child: CachedNetworkImage(
                                              imageUrl: treatmentList[idx],
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                              alignment: Alignment.center,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 30,
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            'Body Massage',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AppStyles.primaryColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList());
                      },
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: 140,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Treatment kami',
                    style: TextStyle(
                        color: AppStyles.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  CarouselSlider.builder(
                      itemCount: (treatmentList.length / 3).round(),
                      itemBuilder: (context, index, realIdx) {
                        final int first = index * 3;
                        final int second = first + 1;
                        final int third = second + 1;
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [first, second, third].map((idx) {
                              return Expanded(
                                child: Container(
                                  height: 130,
                                  margin: EdgeInsets.only(right: 5, left: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 1.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(0.0, 0.0),
                                        )
                                      ]),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 90,
                                            child: CachedNetworkImage(
                                              imageUrl: treatmentList[idx],
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                              alignment: Alignment.center,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 30,
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            'Body Massage',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AppStyles.primaryColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList());
                      },
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: 140,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                      ))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Artikel',
                    style: TextStyle(
                        color: AppStyles.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  CarouselSlider.builder(
                      itemCount: artikelList.length,
                      itemBuilder: (context, index, realIdx) => Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Container(
                              height: 140,
                              margin: EdgeInsets.only(right: 5, left: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 1.0,
                                      spreadRadius: 1.0,
                                      offset: Offset(0.0, 0.0),
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 90,
                                        child: CachedNetworkImage(
                                          imageUrl: artikelList[index],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                          alignment: Alignment.center,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 70,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'RX Relaxology ada 10 Cabang di Indonesia',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: AppStyles.primaryColor,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Kesehatan",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        AppStyles.primaryColor),
                                              ),
                                              Text("23 Okt2024 | 09.00",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppStyles
                                                          .primaryColor)),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: 180,
                          enlargeCenterPage: false,
                          viewportFraction: 0.8,
                          disableCenter: true,
                          initialPage: 0,
                          padEnds: false,
                          clipBehavior: Clip.hardEdge))
                ],
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
        bottomNavigationBar: BottomNavigationComponent(),
      ),
    );
  }

  Container generateDots(int idx) {
    return Container(
      height: 10,
      width: idx == sliderIndex ? 26 : 10,
      margin: const EdgeInsets.only(left: 2.5, right: 2.5),
      decoration: BoxDecoration(
          color: idx == sliderIndex
              ? AppStyles.primaryColor
              : AppStyles.mutedColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.location.request();
    }
    // if (status.isDenied) {
    //   if (await Permission.location.request().isGranted) {
    //     print('Izin lokasi diberikan');
    //   } else {
    //     print('Izin lokasi ditolak');
    //   }
    // } else if (status.isPermanentlyDenied) {
    //   print('Izin lokasi ditolak secara permanen, buka pengaturan aplikasi');
    //   await openAppSettings();
    // } else {
    //   print('Izin lokasi sudah diberikan');
    // }
  }

  Future<void> _requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
    }
    // if (status.isDenied) {
    //   if (await Permission.notification.request().isGranted) {
    //     print('Izin notifikasi diberikan');
    //   } else {
    //     print('Izin notifikasi ditolak');
    //   }
    // } else if (status.isPermanentlyDenied) {
    //   print(
    //       'Izin notifikasi ditolak secara permanen, buka pengaturan aplikasi');
    //   await openAppSettings();
    // } else {
    //   print('Izin notifikasi sudah diberikan');
    // }
  }
}
