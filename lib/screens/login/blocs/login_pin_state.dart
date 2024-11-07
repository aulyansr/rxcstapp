part of 'login_pin_bloc.dart';

sealed class LoginPinState {}

final class LoginPinStateInitial extends LoginPinState {}

final class LoginPinStateProcess extends LoginPinState {}

final class LoginPinStateSuccess extends LoginPinState {}

final class LoginPinStateFailure extends LoginPinState {
  final String errorMessage;
  LoginPinStateFailure({required this.errorMessage});
}
