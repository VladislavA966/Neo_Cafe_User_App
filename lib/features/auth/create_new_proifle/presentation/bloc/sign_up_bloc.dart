import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/core/services/validation.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/use_case/sign_up_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>
    with EmailValidatorMixin {
  final LocalDataSource localDataSource;
  final SignUpUseCase useCase;
  SignUpBloc(this.useCase, this.localDataSource) : super(SignUpInitial()) {
    on<SendNewUserDataEvent>(_sendNewUserData);
    on<SendSignUpCodeEvent>(_sendSignUpCodeEvent);
  }

  FutureOr<void> _sendNewUserData(
      SendNewUserDataEvent event, Emitter emit) async {
    if (!isValidEmail(event.email)) {
      emit(
        ValidationError(errorText: 'Неверный формат почты'),
      );
      return;
    }
    emit(SignUpLoading());
    try {
      await useCase.sendNewUserDataCall(event.email);
      emit(SignUpLoaded());
    } catch (e) {
      emit(
        SignUpError(
            errorText: 'Пользователь с такой почтой уже зарегистрирован'),
      );
    }
  }

  FutureOr<void> _sendSignUpCodeEvent(event, emit) async {
    emit(SignUpLoading());
    try {
      await useCase.sendSignUpCode(event.email, event.code);

      emit(
        CodeSended(),
      );
    } catch (e) {
      emit(
        SignUpError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
