import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/sign_in_remote.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/repo/sign_in_repo.dart';

class SignInRepositotyImpl implements SignInRepo {
  final SignInRemote remote;
  final LocalDataSource local;

  SignInRepositotyImpl({required this.remote, required this.local});
  @override
  Future<void> sendCode(String email, String code) async {
    final tokenRemote = await remote
        .confirmLoginCode({"email": email, "confirmation_code": code});
    await local.saveToken(
      tokenRemote.accessToken,
      tokenRemote.refreshToken,
    );
    await local.saveId(
      tokenRemote.customerProfile.customerId.toString(),
    );
  }

  @override
  Future<void> sendEmail(String email) async {
    await remote.loginWithEmail({"email": email});
  }
}
