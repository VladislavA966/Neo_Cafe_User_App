abstract class SignUpRepo {
  Future<void> sendNewUserData(String name, String email, String date);
  Future<void> sendSignUpCode(String code);
}
