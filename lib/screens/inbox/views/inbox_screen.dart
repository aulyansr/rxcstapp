import 'package:flutter/material.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class InboxData {
  String title;
  bool isRead = false;
  String desc;
  DateTime date;
  InboxData(
      {required this.title,
      required this.isRead,
      required this.desc,
      required this.date});
}

class _InboxScreenState extends State<InboxScreen> {
  final List<InboxData> _data = [
    InboxData(
        title: "Treatment Dimulai",
        desc:
            "Treatment mu 30 menit lagi udah mau dimulai nih, yuk segera datang",
        isRead: false,
        date: DateTime(2024, 10, 30, 10, 30)),
    InboxData(
        title: "Redeem Point Berhasil",
        desc: "Kamu bisa cek poin hasil redeem kamu disini",
        isRead: true,
        date: DateTime(2024, 10, 30, 09, 30))
  ];
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
                  "Inbox",
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
                sliver: SliverList.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, idx) {
                      DateTime diffDate =
                          DateTime.now().subtract(Duration(hours: 3));
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            if (!_data[idx].isRead)
                              Positioned(
                                  right: 0,
                                  child: SizedBox(
                                    width: 6,
                                    height: 6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _data[idx].title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppStyles.primaryColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _data[idx].desc,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: AppStyles.mutedColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    timeago.format(_data[idx].date),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: AppStyles.mutedColor2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        onRefresh: () async {});
  }
}
