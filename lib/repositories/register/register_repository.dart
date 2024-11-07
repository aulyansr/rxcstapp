import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rx_customer/config/dio_config.dart';
import 'package:rx_customer/models/register/request/register_request.dart';
import 'package:rx_customer/models/register/request/register_set_pin_request.dart';
import 'package:rx_customer/service_locator.dart';

abstract class RegisterRepository {
  Future<Either> registerOtp(RegisterRequest registerRequest);
  Future<Either> registerSetPin(RegisterSetPinRequest registerRequest);
}

class IRegisterRepository extends RegisterRepository {
  @override
  Future<Either> registerOtp(RegisterRequest registerRequest) async {
    try {
      var response = await sl<DioConfig>()
          .post('api/auth/customer/register', data: registerRequest.toJson());
      return Right(response);
    } on DioException catch (e) {
      print(e.response!.data);
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
      return Left("Gagal menghubungi server");
    }
  }

  @override
  Future<Either> registerSetPin(
      RegisterSetPinRequest registerSetPinRequest) async {
    try {
      var response = await sl<DioConfig>().post('api/auth/customer/createpin',
          data: registerSetPinRequest.toJson());
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
      return Left("Gagal menghubungi server");
    }
  }
}
