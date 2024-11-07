part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginCheckPhoneNumberSubmit extends LoginEvent {
  final String phone;
  LoginCheckPhoneNumberSubmit({required this.phone});
  List<Object> get props => [phone];
}
