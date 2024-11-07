import 'package:flutter/material.dart';
import 'package:rx_customer/res/app_styles.dart';

class LocationPermissionComponent extends StatefulWidget {
  const LocationPermissionComponent({super.key});

  @override
  State<LocationPermissionComponent> createState() =>
      _LocationPermissionComponentState();
}

class _LocationPermissionComponentState
    extends State<LocationPermissionComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.whiteColor,
        surfaceTintColor: AppStyles.whiteColor,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            padding: const EdgeInsets.only(left: 30, right: 30),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            )),
      ),
      body: Expanded(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Tidak Bisa Akses Lokasimu")],
        ),
      )),
    );
  }
}
