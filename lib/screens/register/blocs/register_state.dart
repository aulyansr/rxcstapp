part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterGetOtpInitial extends RegisterState {}

final class RegisterGetOtpProcess extends RegisterState {}

final class RegisterGetOtpSuccess extends RegisterState {}

final class RegisterGetOtpFailure extends RegisterState {
  final String errorMessage;
  RegisterGetOtpFailure({required this.errorMessage});
}
