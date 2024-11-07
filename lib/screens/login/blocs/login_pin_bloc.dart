import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rx_customer/models/login/request/login_pin_request.dart';
import 'package:rx_customer/repositories/login/login_repository.dart';
import 'package:rx_customer/service_locator.dart';

part 'login_pin_event.dart';
part 'login_pin_state.dart';

class LoginPinBloc extends Bloc<LoginPinEvent, LoginPinState> {
  final LoginRepository _loginRepository = sl<LoginRepository>();
  LoginPinBloc() : super(LoginPinStateInitial()) {
    on<LoginPinEventSubmit>(_onLoginPinEventSubmit);
  }
  Future<void> _onLoginPinEventSubmit(
      LoginPinEventSubmit event, Emitter<LoginPinState> emit) async {
    emit(LoginPinStateProcess());
    try {
      Either response = await _loginRepository.loginCheckPin(
          LoginPinRequest(phone: event.customer_phone, pin: event.pin));
      response.fold((error) {
        emit(LoginPinStateFailure(errorMessage: error));
      }, (success) async {
        emit(LoginPinStateSuccess());
        final storage = FlutterSecureStorage();
        await storage.write(
            key: 'token', value: success.data['data']['customer_token']);
      });
    } catch (err) {
      emit(LoginPinStateFailure(errorMessage: err.toString()));
    }
  }
}
