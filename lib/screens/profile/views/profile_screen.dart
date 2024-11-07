import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../res/app_styles.dart';
import '../../inbox/views/inbox_screen.dart';
import 'package:rx_customer/screens/profile/views/notification_settings_screen.dart';
import 'package:rx_customer/screens/profile/views/cs_screen.dart';
import 'package:rx_customer/screens/promotions/views/promotion_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class ProfileData {
  final String nama;
  final String phone_number;
  final IconData icon;
  final double wallet_balance;
  final double point_balance;
  final Widget screen;
  final String image; // URL path of the profile image

  ProfileData({
    required this.nama,
    required this.phone_number,
    required this.wallet_balance,
    required this.point_balance,
    required this.icon,
    required this.screen,
    required this.image,
  });
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6F7),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                "Akun Saya",
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
              padding: const EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none, // Allows for overflow
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5), // Border width
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppStyles
                                .primaryColor, // Background color of the border
                            shape: BoxShape.circle, // Make it circular
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: CachedNetworkImageProvider(
                              "https://cdn.icon-icons.com/icons2/2643/PNG/512/user_icon_159927.png",
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                IconlyBold.edit,
                                color: AppStyles.primaryColor,
                              ),
                            ),
                          ),
                          // Edit button,
                        )
                      ],
                    ),
                    const SizedBox(height: 20), // Vertical space between items
                    Column(
                      children: [
                        Text(
                          "Dedemy",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppStyles.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "+6281234567890",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 5), // Margin between columns
                            decoration: BoxDecoration(
                              color: AppStyles
                                  .primaryColor, // Set the background color to red
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius:
                                      2, // Spread radius of the shadow
                                  blurRadius: 5, // Blur radius of the shadow
                                  offset: const Offset(
                                      0, 3), // Offset of the shadow
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 8), // Padding inside the container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/icon-saldo.png'),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the start
                                  children: [
                                    Text(
                                      "Saldo Wallet",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors
                                            .white, // Change text color to white for contrast
                                      ),
                                    ),
                                    Text(
                                      "Rp 1.000.000",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .white, // Change text color to white for contrast
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 5), // Margin between columns
                            decoration: BoxDecoration(
                              color: AppStyles
                                  .primaryColor, // Set the background color to red
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius:
                                      2, // Spread radius of the shadow
                                  blurRadius: 5, // Blur radius of the shadow
                                  offset: const Offset(
                                      0, 3), // Offset of the shadow
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10), // Padding inside the container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/icon-poin.png'),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the start
                                  children: [
                                    Text(
                                      "Poin",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors
                                            .white, // Change text color to white for contrast
                                      ),
                                    ),
                                    Text(
                                      "100.000",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .white, // Change text color to white for contrast
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Akun",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppStyles.primaryColor,
                            ),
                          ),
                        ]),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InboxScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppStyles.mutedColor, // Border color
                                width: 1, // Border thickness
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Aktifitas",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.blackPrimary,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PromotionScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppStyles.mutedColor, // Border color
                                width: 1, // Border thickness
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Promo",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.blackPrimary,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Info lainnya",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppStyles.primaryColor,
                            ),
                          ),
                        ]),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CsScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppStyles.mutedColor, // Border color
                                width: 1, // Border thickness
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pusat Bantuan",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.blackPrimary,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationSettingsScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppStyles.mutedColor, // Border color
                                width: 1, // Border thickness
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Notifikasi",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.blackPrimary,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationSettingsScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppStyles.mutedColor, // Border color
                                width: 1, // Border thickness
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kebijakan Privasi",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.blackPrimary,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InboxScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppStyles.mutedColor, // Border color
                                width: 1, // Border thickness
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ketentuan Layanan",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.blackPrimary,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InboxScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppStyles.mutedColor, // Border color
                                width: 1, // Border thickness
                              ),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Beri Rating",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.blackPrimary,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity, // Make the button fill the width
                      child: TextButton(
                        onPressed: () {
                          // Implement logout functionality
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppStyles.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
