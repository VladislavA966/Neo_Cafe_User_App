import 'package:dio/dio.dart';

abstract class SignUpRemote {
  Future<void> sendNewUserData(String name, String email, String date);
  Future<void> sendSignUpCode(String code);
}

class SignUpRemoteImpl implements SignUpRemote {
  final Dio dio;

  SignUpRemoteImpl({required this.dio});
  @override
  Future<void> sendNewUserData(String name, String email, String date) {
    // TODO: implement sendNewUserData
    throw UnimplementedError();
  }

  @override
  Future<void> sendSignUpCode(String code) {
    // TODO: implement sendSignUpCode
    throw UnimplementedError();
  }
}
