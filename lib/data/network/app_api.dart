import 'package:dio/dio.dart';
import 'package:newtr_application/app/constants.dart';
import 'package:newtr_application/data/response/responses.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl : Constants.baseUrl)
abstract class AppServiceClient {

  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  
  @POST("/customers/Login")
  Future<AuthenticationResponse> login(
    @Field("email") String email , @Field("password") String password);
}