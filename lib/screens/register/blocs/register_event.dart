part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterGetOtpSubmit extends RegisterEvent {
  final String customer_name;
  final String customer_phone;

  RegisterGetOtpSubmit(this.customer_name, this.customer_phone);
  List<Object?> get props => [customer_name, customer_phone];
}
