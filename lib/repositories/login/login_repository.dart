import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rx_customer/config/dio_config.dart';
import 'package:rx_customer/models/login/request/login_pin_request.dart';
import 'package:rx_customer/models/login/request/login_request.dart';
import 'package:rx_customer/service_locator.dart';

abstract class LoginRepository {
  Future<Either> loginCheckPhoneNumber(LoginRequest loginRequest);
  Future<Either> loginCheckPin(LoginPinRequest loginPinRequest);
}

class ILoginRepository extends LoginRepository {
  @override
  Future<Either> loginCheckPhoneNumber(LoginRequest loginRequest) async {
    try {
      var response = await sl<DioConfig>().post(
          'api/auth/customer/checkphonenumber',
          data: loginRequest.toJson());
      return Right(response);
    } on DioException catch (e) {
      // print(e.response!.data);
      if (e.response!.statusCode == 422) {
        Map<String, dynamic> errors = e.response!.data['data'] ?? {};
        List<String> errorMessages = [];
        errors.forEach((field, messages) {
          if (messages is List) {
            String fieldErrors = messages.join(', ');
            errorMessages.add('$fieldErrors');
          }
        });
        return Left(errorMessages.join('\n'));
      }
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> loginCheckPin(LoginPinRequest loginPinRequest) async {
    try {
      var response = await sl<DioConfig>()
          .post('api/auth/customer/verifypin', data: loginPinRequest.toJson());
      return Right(response);
    } on DioException catch (e) {
      // print(e.response!.data);
      if (e.response!.statusCode == 422) {
        Map<String, dynamic> errors = e.response!.data['data'] ?? {};
        List<String> errorMessages = [];
        errors.forEach((field, messages) {
          if (messages is List) {
            String fieldErrors = messages.join(', ');
            errorMessages.add('$fieldErrors');
          }
        });
        return Left(errorMessages.join('\n'));
      }
      return Left(e.response!.data['message']);
    }
  }
}
