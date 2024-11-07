import 'package:flutter/material.dart';

void showDialogErrors(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: null,
        content: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.warning,
              color: Colors.orange,
              size: 70,
            ),
            SizedBox(height: 10),
            Text(
              "Opps terjadi kesalahan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 30),
            ...errorMessage.split('\n').map((msg) => Text(msg)).toList()
          ],
        )),
        actions: <Widget>[
          Center(
            child: TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
              },
            ),
          ),
        ],
      );
    },
  );
}
