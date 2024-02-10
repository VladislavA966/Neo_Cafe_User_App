import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
// import 'package:neo_cafe_24/features/auth/create_new_proifle/data/models/token_model.dart';

part 'sign_up_remote.g.dart';

@RestApi()
abstract class SignUpRemote {
  factory SignUpRemote(Dio dio, {String baseUrl}) = _SignUpRemote;

  @POST('/customer/check-email-register/')
  Future<void> sendNewUserData(@Body() Map<String, dynamic> data);

  @POST('/customer/register/')
  Future<void> sendSignUpCode(@Body() Map<String, dynamic> data);
}
