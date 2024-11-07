part of 'register_pin_bloc.dart';

sealed class RegisterPinState {}

final class RegisterPinInitial extends RegisterPinState {}

final class RegisterPinProcess extends RegisterPinState {}

final class RegisterPinSuccess extends RegisterPinState {}

final class RegisterPinFailure extends RegisterPinState {
  final String errorMessage;
  RegisterPinFailure({required this.errorMessage});
}
