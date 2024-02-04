import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/auth/create_new_proifle/domain/use_case/sign_up_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase useCase;
  SignUpBloc(this.useCase) : super(SignUpInitial()) {
    sendNewUserDataEvent();
    sendSignUpCode();
  }

  void sendNewUserDataEvent() {
    return on<SendNewUserDataEvent>(
      (event, emit) async {
        emit(SignUpLoading());
        try {
          await useCase.sendNewUserDataCall(
              event.name, event.email, event.date);
          emit(
            SignUpLoaded(),
          );
        } catch (e) {
          emit(
            SignUpError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }

  void sendSignUpCode() {
    return on<SendSignUpCodeEvent>(
      (event, emit) async {
        emit(SignUpLoading());
        try {
          await useCase.sendSignUpCode(event.code);
          emit(
            SignUpLoaded(),
          );
        } catch (e) {
          emit(
            SignUpError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }
}
