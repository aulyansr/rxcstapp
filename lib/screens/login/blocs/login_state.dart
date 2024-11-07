part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginCheckPhoneNumberInitial extends LoginState {}

final class LoginCheckPhoneNumberProcess extends LoginState {}

final class LoginCheckPhoneNumberSuccess extends LoginState {
  final LoginCheckPhoneResponse user;
  LoginCheckPhoneNumberSuccess({required this.user});
}

final class LoginCheckPhoneNumberFailure extends LoginState {
  final String errorMessage;
  LoginCheckPhoneNumberFailure({required this.errorMessage});
}
