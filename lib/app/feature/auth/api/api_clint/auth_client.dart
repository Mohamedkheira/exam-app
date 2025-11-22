import 'package:dio/dio.dart';
import 'package:exam_app/app/core/value/app_endpoint.dart';
import 'package:exam_app/app/feature/auth/data/model/login_responce_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@injectable
@RestApi()
abstract class HomeApiClint {
  @factoryMethod
  factory HomeApiClint(Dio dio) = _HomeApiClint;

  @POST(AppEndPoint.login)
  Future<LoginResponceModel> login(@Body() Map<String, dynamic> data);
}
