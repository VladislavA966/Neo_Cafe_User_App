import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/core/services/validation.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/use_case/sign_in_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>
    with EmailValidatorMixin {
  final SignInUseCase useCase;
  final LocalDataSource localData;
  SignInBloc(this.useCase, this.localData) : super(SignInInitial()) {
    on<SendEmailForSingInEvent>(_sendEmailForSignIn);
    on<SendCodeForSingInEvent>(_sendCodeForSignInEvent);
  }

  FutureOr<void> _sendEmailForSignIn(
      SendEmailForSingInEvent event, Emitter<SignInState> emit) async {
    if (!isValidEmail(event.email)) {
      emit(SignInValidationError(errorText: 'Неверный формат почты'));
      return;
    }
    emit(SignInLoading());
    try {
      await useCase.sendEmailCall(event.email);
      emit(SignInLoaded());
    } catch (e) {
      emit(
        SignInError(
          errorText: 'Пользователя с такой почтой не существует',
        ),
      );
    }
  }

  FutureOr<void> _sendCodeForSignInEvent(
      SendCodeForSingInEvent event, Emitter<SignInState> emit) async {
    emit(
      SignInLoading(),
    );
    try {
      await useCase.sendCodeCall(event.email, event.code);

      emit(
        SendCodeLoaded(),
      );
    } catch (e) {
      emit(
        SignInError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
