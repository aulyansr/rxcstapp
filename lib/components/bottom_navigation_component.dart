import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/activity/views/activity_screen.dart';
import 'package:rx_customer/screens/home/views/home_screen.dart';
import 'package:rx_customer/screens/inbox/views/inbox_screen.dart';
import 'package:rx_customer/screens/outlet/views/outlet_list_screen.dart';
import 'package:rx_customer/screens/profile/views/profile_screen.dart';

class BottomNavigationComponent extends StatelessWidget {
  const BottomNavigationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Colors.white,
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: AppStyles.mutedColor2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.home,
                        size: 30,
                      ),
                      SizedBox(height: 3),
                      Text("Home")
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InboxScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: AppStyles.mutedColor2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.message,
                        size: 30,
                      ),
                      SizedBox(height: 3),
                      Text("Inbox")
                    ],
                  )),
              SizedBox(width: 80),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: AppStyles.mutedColor2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.document,
                        size: 30,
                      ),
                      SizedBox(height: 3),
                      Text("Aktivitas")
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: AppStyles.mutedColor2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.profile,
                        size: 30,
                      ),
                      SizedBox(height: 3),
                      Text("Akun")
                    ],
                  ))
            ],
          ),
        ),
        Positioned(
          top: -30,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              width: 90,
              height: 90,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 4.0),
                    ),
                  ]),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OutletListScreen()),
                    );
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppStyles.primaryColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconlyBold.calendar,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(height: 1),
                      Text(
                        "Pesan",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
            ),
          ),
        )
      ],
    );
    // return BottomAppBar(
    //   padding: EdgeInsets.all(5),
    //   color: Colors.white,
    //   child: Container(
    //     height: 30,
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         TextButton(
    //             onPressed: null,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(
    //                   IconlyBold.home,
    //                   size: 30,
    //                 ),
    //                 SizedBox(height: 3),
    //                 Text("Home")
    //               ],
    //             )),
    //         TextButton(
    //             onPressed: null,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(
    //                   IconlyBold.message,
    //                   size: 30,
    //                 ),
    //                 SizedBox(height: 3),
    //                 Text("Inbox")
    //               ],
    //             )),
    //         SizedBox(width: 30),
    //         TextButton(
    //             onPressed: null,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(
    //                   IconlyBold.document,
    //                   size: 30,
    //                 ),
    //                 SizedBox(height: 3),
    //                 Text("Aktivitas")
    //               ],
    //             )),
    //         TextButton(
    //             onPressed: null,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(
    //                   IconlyBold.profile,
    //                   size: 30,
    //                 ),
    //                 SizedBox(height: 3),
    //                 Text("Akun")
    //               ],
    //             ))
    //       ],
    //     ),
    //   ),
    // );
  }
}
