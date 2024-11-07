import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rx_customer/models/register/request/register_request.dart';
import 'package:rx_customer/repositories/register/register_repository.dart';
import 'package:rx_customer/service_locator.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository _registerRepository = sl<RegisterRepository>();
  // final RegisterRepository registerRepository;
  RegisterBloc() : super(RegisterGetOtpInitial()) {
    on<RegisterGetOtpSubmit>(_onRegisterGetOtp);
  }
  Future<void> _onRegisterGetOtp(
    RegisterGetOtpSubmit event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterGetOtpProcess());
    try {
      Either response = await _registerRepository.registerOtp(RegisterRequest(
          customer_name: event.customer_name,
          customer_phone: event.customer_phone));
      response.fold((error) {
        emit(RegisterGetOtpFailure(errorMessage: error));
      }, (success) {
        emit(RegisterGetOtpSuccess());
      });
    } catch (err) {
      emit(RegisterGetOtpFailure(errorMessage: err.toString()));
    }
  }
}
