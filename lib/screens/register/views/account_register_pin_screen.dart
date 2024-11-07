import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/register/blocs/register_pin_bloc.dart';

class AccountRegisterPinScreen extends StatefulWidget {
  final String phone;
  const AccountRegisterPinScreen({super.key, required this.phone});

  @override
  State<AccountRegisterPinScreen> createState() =>
      _AccountRegisterPinScreenState();
}

class _AccountRegisterPinScreenState extends State<AccountRegisterPinScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  List<TextEditingController> controllerPin =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodePin = List.generate(6, (index) => FocusNode());
  List<TextEditingController> controllerRePin =
      List.generate(6, (index) => TextEditingController());
  List<FocusNode> focusNodeRePin = List.generate(6, (index) => FocusNode());

  void nextPinField(
      {required String type, required String value, required int currentIdx}) {
    if (value.isNotEmpty && currentIdx < 5) {
      FocusScope.of(context).requestFocus(type == "pin"
          ? focusNodePin[currentIdx + 1]
          : focusNodeRePin[currentIdx + 1]);
    }
  }

  void previousPinField(
      {required String type, required String value, required int currentIdx}) {
    if (value.isEmpty && currentIdx > 0) {
      FocusScope.of(context).requestFocus(type == "pin"
          ? focusNodePin[currentIdx - 1]
          : focusNodeRePin[currentIdx - 1]);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllerPin) {
      controller.dispose();
    }
    for (var controller in controllerRePin) {
      controller.dispose();
    }
    for (var focusNode in focusNodePin) {
      focusNode.dispose();
    }
    for (var focusNode in focusNodeRePin) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPinBloc(),
      child: Scaffold(
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
        body: BlocListener<RegisterPinBloc, RegisterPinState>(
          listener: (context, state) {},
          child: Form(
              key: _formKey,
              child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text("Set PIN",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: AppStyles.primaryColor)),
                      ),
                      Center(
                        child: Text("Biar akunmu lebih aman!",
                            style: TextStyle(
                                fontSize: 16, color: AppStyles.mutedColor2)),
                      ),
                      SizedBox(height: 26),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Set PIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppStyles.primaryColor),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (idx) {
                              return SizedBox(
                                width: 50,
                                child: TextField(
                                  controller: controllerPin[idx],
                                  focusNode: focusNodePin[idx],
                                  decoration: AppStyles.inputField.copyWith(
                                      contentPadding: EdgeInsets.all(5)),
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      nextPinField(
                                          type: "pin",
                                          value: value,
                                          currentIdx: idx);
                                    } else {
                                      previousPinField(
                                          type: "pin",
                                          value: value,
                                          currentIdx: idx);
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "Konfirmasi PIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppStyles.primaryColor),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (idx) {
                              return SizedBox(
                                width: 50,
                                child: TextField(
                                  controller: controllerRePin[idx],
                                  focusNode: focusNodeRePin[idx],
                                  decoration: AppStyles.inputField.copyWith(
                                      contentPadding: EdgeInsets.all(5)),
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1)
                                  ],
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      nextPinField(
                                          type: "repin",
                                          value: value,
                                          currentIdx: idx);
                                    } else {
                                      previousPinField(
                                          type: "repin",
                                          value: value,
                                          currentIdx: idx);
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocBuilder<RegisterPinBloc, RegisterPinState>(
                            builder: (context, state) {
                              if (state is RegisterPinProcess) {
                                return _buttonSubmitLoader(context);
                              } else {
                                return _buttonSubmit(context);
                              }
                            },
                          ),
                          SizedBox(height: 30)
                        ],
                      ))
                    ],
                  ))),
        ),
      ),
    );
  }

  Widget _buttonSubmit(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String pin =
              controllerPin.map((controller) => controller.text).join('');
          String rePin =
              controllerRePin.map((controller) => controller.text).join('');
          if (pin != rePin) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Pin dan Konfirmasi PIN tidak sesuai")),
            );
          } else {
            context
                .read<RegisterPinBloc>()
                .add(RegisterPinSubmit(customer_phone: widget.phone, pin: pin));
          }
        }
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (_) => const HomeScreen()),
        //     (Route<dynamic> route) => false);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text("Lanjut",
            style: TextStyle(
                color: AppStyles.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppStyles.primaryColor),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 10)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))))),
    );
  }

  Widget _buttonSubmitLoader(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppStyles.primaryColor),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 10)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))))),
    );
  }
}
