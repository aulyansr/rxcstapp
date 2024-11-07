import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/register/views/account_register_pin_screen.dart';

class AccountRegisterOtpScreen extends StatefulWidget {
  const AccountRegisterOtpScreen({super.key});

  @override
  State<AccountRegisterOtpScreen> createState() =>
      _AccountRegisterOtpScreenState();
}

class _AccountRegisterOtpScreenState extends State<AccountRegisterOtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  void nextField({required String value, required int currentIdx}) {
    if (value.isNotEmpty && currentIdx < 5) {
      FocusScope.of(context).requestFocus(focusNodes[currentIdx + 1]);
    }
  }

  void previousField({required String value, required int currentIdx}) {
    if (value.isEmpty && currentIdx > 0) {
      FocusScope.of(context).requestFocus(focusNodes[currentIdx - 1]);
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

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
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Masukkan Kode OTP",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppStyles.primaryColor)),
                Text("Kode akan dikirimkan ke nomor berikut via WhatsApp ",
                    style:
                        TextStyle(fontSize: 16, color: AppStyles.mutedColor2)),
                SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("+62 8123 4567 8900",
                        style: TextStyle(
                            color: AppStyles.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const AccountRegisterPinScreen(
                                        phone: '',
                                      )));
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              color: AppStyles.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Masukkan Kode",
                      style: TextStyle(color: AppStyles.mutedColor2),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (idx) {
                        return SizedBox(
                          width: 50,
                          child: TextField(
                            controller: controllers[idx],
                            focusNode: focusNodes[idx],
                            decoration: AppStyles.inputField
                                .copyWith(contentPadding: EdgeInsets.all(5)),
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                nextField(value: value, currentIdx: idx);
                              } else {
                                previousField(value: value, currentIdx: idx);
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Kirim ulang setelah 0:59 detik",
                            style: TextStyle(
                                color: Color(0xFF6BB334), fontSize: 10)),
                        Spacer(),
                        Text("Kirim Ulang",
                            style: TextStyle(
                                color: AppStyles.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) =>
                                const AccountRegisterPinScreen(phone: '')));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Konfirmasi",
                            style: TextStyle(
                                color: AppStyles.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(AppStyles.primaryColor),
                          minimumSize:
                              WidgetStatePropertyAll(Size(double.infinity, 10)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                    ),
                    SizedBox(height: 30)
                  ],
                ))
              ],
            ),
          )),
    );
  }
}
