part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpLoaded extends SignUpState {}

final class CodeSended extends SignUpState {}

final class CodeError extends SignUpState {
  final String errorText;

  CodeError({required this.errorText});
}

final class SignUpError extends SignUpState {
  final String errorText;

  SignUpError({required this.errorText});
}

final class ValidationError extends SignUpState {
  final String errorText;

  ValidationError({required this.errorText});
}
