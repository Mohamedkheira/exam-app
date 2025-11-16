import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app/app/core/values/app_endpoint_strings.dart';

import '../../feature/auth/api/api_manger/auth_client.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: AppEndpointString.baseUrl));

  @lazySingleton
  AuthApiClient authApiClient(Dio dio) =>
      AuthApiClient(dio, baseUrl: AppEndpointString.baseUrl);
}
