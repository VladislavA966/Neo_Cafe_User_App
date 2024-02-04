part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SendEmailEvent extends SignInEvent {
  final String email;

  SendEmailEvent({required this.email});
}

class SendCodeEvent extends SignInEvent {
  final String code;

  SendCodeEvent({required this.code});
}
