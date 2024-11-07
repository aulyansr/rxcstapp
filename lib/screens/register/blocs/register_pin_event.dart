part of 'register_pin_bloc.dart';

sealed class RegisterPinEvent extends Equatable {
  const RegisterPinEvent();

  @override
  List<Object> get props => [];
}

class RegisterPinSubmit extends RegisterPinEvent {
  final String customer_phone;
  final String pin;
  RegisterPinSubmit({required this.customer_phone, required this.pin});
  List<Object> get props => [customer_phone, pin];
}
