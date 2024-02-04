part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class SendNewUserDataEvent extends SignUpEvent {
  final String name;
  final String email;
  final String date;

  SendNewUserDataEvent(
      {required this.name, required this.email, required this.date});
}

class SendSignUpCodeEvent extends SignUpEvent {
  final String code;

  SendSignUpCodeEvent({required this.code});
}