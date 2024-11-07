part of 'login_pin_bloc.dart';

sealed class LoginPinEvent extends Equatable {
  const LoginPinEvent();

  @override
  List<Object> get props => [];
}

class LoginPinEventSubmit extends LoginPinEvent {
  final String customer_phone;
  final String pin;
  LoginPinEventSubmit({required this.customer_phone, required this.pin});
  List<Object> get props => [customer_phone, pin];
}
