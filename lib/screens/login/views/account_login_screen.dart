import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rx_customer/components/dialog_error.dart';
import 'package:rx_customer/res/app_styles.dart';
import 'package:rx_customer/screens/login/blocs/login_bloc.dart';
import 'package:rx_customer/screens/login/views/account_login_pin_screen.dart';
import 'package:rx_customer/screens/register/views/account_register_pin_screen.dart';
import 'package:rx_customer/screens/register/views/account_register_screen.dart';

class AccountLoginScreen extends StatefulWidget {
  const AccountLoginScreen({super.key});

  @override
  State<AccountLoginScreen> createState() => _AccountLoginScreenState();
}

class _AccountLoginScreenState extends State<AccountLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _txtPhoneController = TextEditingController();

  @override
  void dispose() {
    _txtPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
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
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginCheckPhoneNumberFailure) {
              showDialogErrors(context, state.errorMessage);
            } else if (state is LoginCheckPhoneNumberSuccess) {
              if (state.user.with_pin) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountLoginPinScreen(
                          phone: state.user.customer_phone)),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountRegisterPinScreen(
                          phone: state.user.customer_phone)),
                );
              }
            }
          },
          child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: SvgPicture.asset(
                          "assets/images/login.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                        "Selamat Datang!",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppStyles.primaryColor),
                      ),
                      Text(
                        "Login untuk melanjutkan",
                        style: TextStyle(
                            fontSize: 16, color: AppStyles.mutedColor2),
                      ),
                      SizedBox(height: 35),
                      TextFormField(
                        controller: _txtPhoneController,
                        decoration: AppStyles.inputField
                            .copyWith(hintText: "Masukkan Nomor HP"),
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: false, signed: true),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nomo HP wajib diisi";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginCheckPhoneNumberProcess) {
                            return _buttonSubmitLoader(context);
                          } else {
                            return _buttonSubmit(context);
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      RichText(
                          text: TextSpan(
                              text: 'Belum punya akun? Yuk ',
                              style: TextStyle(color: AppStyles.mutedColor2),
                              children: <TextSpan>[
                            TextSpan(
                                text: 'sign up ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const AccountRegisterScreen()));
                                  },
                                style: TextStyle(
                                    color: AppStyles.primaryColor,
                                    fontWeight: FontWeight.bold))
                          ])),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget _buttonSubmit(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<LoginBloc>().add(
              LoginCheckPhoneNumberSubmit(phone: _txtPhoneController.text));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.red,
                content: Text("No. HP wajib diisi")),
          );
        }
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => const AccountLoginPinScreen()),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text("Login",
            style: TextStyle(
                color: AppStyles.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppStyles.secondaryColor),
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
            color: AppStyles.primaryColor,
            strokeWidth: 2,
          ),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppStyles.secondaryColor),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 10)),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))))),
    );
  }
}
