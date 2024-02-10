part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class SendEmailForSingInEvent extends SignInEvent {
  final String email;

  SendEmailForSingInEvent({required this.email});
}

class SendCodeForSingInEvent extends SignInEvent {
  final String email;
  final String code;

  SendCodeForSingInEvent(this.email, {required this.code});
}
