import 'package:get_it/get_it.dart';
import 'package:rx_customer/config/dio_config.dart';
import 'package:rx_customer/repositories/login/login_repository.dart';
import 'package:rx_customer/repositories/register/register_repository.dart';

final sl = GetIt.instance;
void SetupServiceLocator() {
  sl.registerSingleton<DioConfig>(DioConfig());

  sl.registerSingleton<LoginRepository>(ILoginRepository());
  sl.registerSingleton<RegisterRepository>(IRegisterRepository());
}
