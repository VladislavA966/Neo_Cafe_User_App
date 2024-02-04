abstract class SignInRepo {
  Future<void> sendEmail(String email);
  Future<void> sendCode(String code);
}
