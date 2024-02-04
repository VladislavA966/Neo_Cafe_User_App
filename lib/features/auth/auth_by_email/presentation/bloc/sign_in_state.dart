part of 'sign_in_bloc.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInLoaded extends SignInState {}

final class SignInError extends SignInState {
  final String errorText;

  SignInError({required this.errorText});
}
