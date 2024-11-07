import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_customer/components/dialog_error.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/home/views/home_screen.dart';
import 'package:rx_customer/screens/login/blocs/login_pin_bloc.dart';

class AccountLoginPinScreen extends StatefulWidget {
  final String phone;
  const AccountLoginPinScreen({super.key, required this.phone});

  @override
  State<AccountLoginPinScreen> createState() => _AccountLoginPinState();
}

class _AccountLoginPinState extends State<AccountLoginPinScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String pin = '';
  int currentIdx = 0;

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

  void _onKeyTapped(String value) {
    if (currentIdx < 6) {
      setState(() {
        pin += value;
        controllers[currentIdx].text = value;
        currentIdx++;
        if (currentIdx == 6) {
          // BlocProvider.of<LoginPinBloc>(context)
          //     .add(LoginPinEventSubmit(customer_phone: widget.phone, pin: pin));
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (_) => const HomeScreen()),
          //     (Route<dynamic> route) => false);
        }
      });
    }
  }

  void _onBackspace() {
    if (currentIdx > 0) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
        controllers[currentIdx - 1].clear();
        currentIdx--;
      });
    } else {
      controllers[currentIdx].clear();
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
    return BlocProvider(
      create: (context) => LoginPinBloc(),
      child: Scaffold(
        body: BlocListener<LoginPinBloc, LoginPinState>(
          listener: (context, state) {
            if (state is LoginPinStateFailure) {
              showDialogErrors(context, state.errorMessage);
            } else if (state is LoginPinStateSuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            }
          },
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 132),
                  Center(
                    child: Text(
                      "Masukkan PIN",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppStyles.primaryColor),
                    ),
                  ),
                  SizedBox(height: 83),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (idx) {
                        return SizedBox(
                          width: 50,
                          child: TextField(
                            readOnly: true,
                            controller: controllers[idx],
                            focusNode: focusNodes[idx],
                            decoration: AppStyles.inputField
                                .copyWith(contentPadding: EdgeInsets.all(5)),
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
                                nextField(value: value, currentIdx: idx);
                              } else {
                                previousField(value: value, currentIdx: idx);
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                  BlocBuilder<LoginPinBloc, LoginPinState>(
                    builder: (context, state) {
                      if (state is LoginPinStateProcess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: AppStyles.primaryColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text("Validating")
                              ],
                            )
                          ],
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  SizedBox(height: 80),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lupa PIN?",
                        style: TextStyle(color: AppStyles.mutedColor2),
                      )),
                  SizedBox(height: 30),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: AppStyles.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, -5))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(31),
                            topRight: Radius.circular(31))),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.7),
                        itemCount: 12,
                        itemBuilder: (context, idx) {
                          if (idx < 9) {
                            return buildNumpadButton(context, '${idx + 1}');
                          } else if (idx == 9) {
                            return SizedBox.shrink();
                          } else if (idx == 10) {
                            return buildNumpadButton(context, '0');
                          } else {
                            return buildNumpadButton(context, Icons.backspace,
                                isIcon: true);
                          }
                        }),
                  ))
                ],
              )),
        ),
      ),
    );
  }

  Widget buildNumpadButton(BuildContext context, dynamic label,
      {bool isIcon = false}) {
    return GestureDetector(
      onTap: () {
        if (isIcon) {
          _onBackspace();
        } else {
          _onKeyTapped(label.toString());
          if (currentIdx == 6) {
            context.read<LoginPinBloc>().add(
                LoginPinEventSubmit(customer_phone: widget.phone, pin: pin));
          }
        }
      },
      child: Center(
        child: isIcon
            ? Icon(label, size: 30)
            : Text(
                label,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppStyles.primaryColor),
              ),
      ),
    );
  }
}
