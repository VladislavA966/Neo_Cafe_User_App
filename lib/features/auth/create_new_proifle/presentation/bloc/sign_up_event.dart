part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class SendNewUserDataEvent extends SignUpEvent {
  final String email;

  SendNewUserDataEvent({required this.email});
}

class SendSignUpCodeEvent extends SignUpEvent {
  final String email;
  final String code;

  SendSignUpCodeEvent({required this.email, required this.code});
}
