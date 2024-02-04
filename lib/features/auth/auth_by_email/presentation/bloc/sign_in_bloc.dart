import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/auth/auth_by_email/domain/use_case/sign_in_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase useCase;
  SignInBloc(this.useCase) : super(SignInInitial()) {
    _sendEmailEvent();
    _sendCodeEvent();
  }

  void _sendEmailEvent() {
    return on<SendEmailEvent>(
      (event, emit) async {
        emit(
          SignInLoading(),
        );
        try {
          await useCase.sendEmailCall(event.email);
          emit(
            SignInLoaded(),
          );
        } catch (e) {
          emit(
            SignInError(
              errorText: e.toString(),
            ),
          );
        }
      },
    );
  }

  void _sendCodeEvent() {
    return on<SendCodeEvent>((event, emit) async {
      emit(
        SignInLoading(),
      );
      try {
        await useCase.sendCodeCall(event.code);
        emit(
          SignInLoaded(),
        );
      } catch (e) {
        emit(
          SignInError(
            errorText: e.toString(),
          ),
        );
      }
    });
  }
}
