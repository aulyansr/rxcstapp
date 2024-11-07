import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rx_customer/models/register/request/register_set_pin_request.dart';
import 'package:rx_customer/repositories/register/register_repository.dart';
import 'package:rx_customer/service_locator.dart';

part 'register_pin_event.dart';
part 'register_pin_state.dart';

class RegisterPinBloc extends Bloc<RegisterPinEvent, RegisterPinState> {
  final RegisterRepository _registerRepository = sl<RegisterRepository>();
  RegisterPinBloc() : super(RegisterPinInitial()) {
    on<RegisterPinSubmit>(_onRegisterSubmit);
  }
  Future<void> _onRegisterSubmit(
      RegisterPinSubmit event, Emitter<RegisterPinState> emit) async {
    emit(RegisterPinProcess());
    try {
      Either response = await _registerRepository.registerSetPin(
          RegisterSetPinRequest(
              customer_phone: event.customer_phone, pin: event.pin));
      response.fold((error) {
        emit(RegisterPinFailure(errorMessage: error));
      }, (success) {
        emit(RegisterPinSuccess());
      });
    } catch (err) {
      emit(RegisterPinFailure(errorMessage: err.toString()));
    }
  }
}
