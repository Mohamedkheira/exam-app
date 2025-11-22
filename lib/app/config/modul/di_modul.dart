import 'package:exam_app/app/core/value/app_endpoint.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: AppEndPoint.baseUrl));
}
