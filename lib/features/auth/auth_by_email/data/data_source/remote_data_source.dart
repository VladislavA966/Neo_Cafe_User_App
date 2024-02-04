import 'package:dio/dio.dart';

abstract class SignInRemote {
  Future<void> sendEmail(String email);
  Future<void> sendCode(String code);
}

class SignInRemoteImpl implements SignInRemote {
  final Dio dio;

  SignInRemoteImpl({required this.dio});
  @override
  Future<void> sendCode(String code) {
    // TODO: implement sendCode
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmail(String email) {
    // TODO: implement sendEmail
    throw UnimplementedError();
  }
}
