
abstract class SignUpRepo {
  Future<void> sendNewUserData(String email);
  Future<void> sendSignUpCode(String email, String code);
}
