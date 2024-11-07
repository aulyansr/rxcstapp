import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rx_customer/models/login/request/login_request.dart';
import 'package:rx_customer/models/login/response/login_check_phone_response.dart';
import 'package:rx_customer/repositories/login/login_repository.dart';
import 'package:rx_customer/service_locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository = sl<LoginRepository>();
  LoginBloc() : super(LoginCheckPhoneNumberInitial()) {
    on<LoginCheckPhoneNumberSubmit>(_onLoginCheckPhoneNumberSubmit);
  }
  Future<void> _onLoginCheckPhoneNumberSubmit(
      LoginCheckPhoneNumberSubmit event, Emitter<LoginState> emit) async {
    emit(LoginCheckPhoneNumberProcess());
    try {
      Either response = await _loginRepository
          .loginCheckPhoneNumber(LoginRequest(phone: event.phone));
      response.fold((error) {
        emit(LoginCheckPhoneNumberFailure(errorMessage: error));
      }, (success) {
        Response response = success;
        emit(LoginCheckPhoneNumberSuccess(
            user: LoginCheckPhoneResponse.fromJson(response.data['data'])));
      });
    } catch (err) {
      emit(LoginCheckPhoneNumberFailure(errorMessage: err.toString()));
    }
  }
}
