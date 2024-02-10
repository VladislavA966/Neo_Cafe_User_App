import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/data/models/token_model.dart';
import 'package:retrofit/retrofit.dart';
part 'sign_in_remote.g.dart';
@RestApi()
abstract class SignInRemote {
factory SignInRemote(Dio dio, {String baseUrl }) = _SignInRemote;

@POST('/customer/check-email-login/')
Future<void> loginWithEmail(@Body() Map<String, dynamic> data);
@POST('/customer/login/')
Future<TokenModel> confirmLoginCode(@Body() Map<String, dynamic> data);

}
