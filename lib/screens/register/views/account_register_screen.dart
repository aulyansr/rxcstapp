import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rx_customer/components/dialog_error.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/login/views/account_login_screen.dart';
import 'package:rx_customer/screens/register/blocs/register_bloc.dart';

class AccountRegisterScreen extends StatefulWidget {
  const AccountRegisterScreen({super.key});

  @override
  State<AccountRegisterScreen> createState() => _AccountRegisterScreenState();
}

class _AccountRegisterScreenState extends State<AccountRegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool? _isTncChecked = false;

  final _txtNameController = TextEditingController();
  final _txtPhoneController = TextEditingController();

  @override
  void dispose() {
    _txtNameController.dispose();
    _txtPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
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
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterGetOtpInitial) {
            } else if (state is RegisterGetOtpSuccess) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => const AccountRegisterOtpScreen()),
              // );
            } else if (state is RegisterGetOtpFailure) {
              showDialogErrors(context, state.errorMessage);
            }
            // TODO: implement listener
          },
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Selamat Datang!",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: AppStyles.primaryColor)),
                            Text("Ayo registrasi dan buat akun barumu!",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppStyles.mutedColor2)),
                            SizedBox(height: 50),
                            Text(
                              "Nama",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.primaryColor),
                            ),
                            SizedBox(height: 7),
                            TextFormField(
                              controller: _txtNameController,
                              decoration: AppStyles.inputField,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama wajib diisi.';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Nomor HP",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppStyles.primaryColor),
                            ),
                            SizedBox(height: 7),
                            IntlPhoneField(
                                controller: _txtPhoneController,
                                decoration: AppStyles.inputField,
                                initialCountryCode: 'ID',
                                initialValue: null,
                                onChanged: (phone) {
                                  // print(phone);
                                },
                                onCountryChanged: (country) {
                                  // print(country);
                                }),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  "Kode Referral",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppStyles.primaryColor),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "(Opsional)",
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFFBCD78D)),
                                )
                              ],
                            ),
                            SizedBox(height: 7),
                            TextField(decoration: AppStyles.inputField),
                            SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: "Sudah punya akun? silakan ",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF808083)),
                          children: <TextSpan>[
                            TextSpan(
                                text: "Login",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const AccountLoginScreen()));
                                  },
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppStyles.primaryColor))
                          ])),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: BorderSide(color: AppStyles.mutedColor),
                          // fillColor: WidgetStatePropertyAll(AppStyles.whiteColor),
                          activeColor: AppStyles.primaryColor,
                          value: _isTncChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isTncChecked = value;
                            });
                          }),
                      Expanded(
                        child: RichText(
                            text: TextSpan(
                                text: 'Dengan membuat akun, saya menyetujui ',
                                style: TextStyle(color: Color(0xFF6BB334)),
                                children: <TextSpan>[
                              TextSpan(
                                  text: 'S&K Aplikasi ',
                                  style: TextStyle(
                                      color: AppStyles.primaryColor,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: 'serta ',
                                  style: TextStyle(color: Color(0xFF6BB334))),
                              TextSpan(
                                  text: 'Kebijakan Privasi ',
                                  style: TextStyle(
                                      color: AppStyles.primaryColor,
                                      fontWeight: FontWeight.bold))
                            ])),
                      )
                    ],
                  ),
                  SizedBox(height: 7),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      if (state is RegisterGetOtpProcess) {
                        return _buttonSubmitLoader(context);
                      }
                      return _buttonSubmit(context);
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonSubmit(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          if (_isTncChecked == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Harap setujui syarat dan ketentuan")),
            );
          } else {
            context.read<RegisterBloc>().add(RegisterGetOtpSubmit(
                _txtNameController.text, _txtPhoneController.text));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.red,
                content: Text("Periksa kembali input anda")),
          );
        }
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
              borderRadius: BorderRadius.all(Radius.circular(15))))),
    );
  }

  Widget _buttonSubmitLoader(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Padding(
        padding: const EdgeInsets.all(12),
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
              borderRadius: BorderRadius.all(Radius.circular(15))))),
    );
  }
}
