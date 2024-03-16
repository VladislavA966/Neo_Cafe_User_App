import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neo_cafe_24/features/branches/domain/use_case/get_all_branches_use_case.dart';
import 'package:neo_cafe_24/features/profile/domain/entity/profile_entity.dart';
import 'package:neo_cafe_24/features/profile/domain/use_case/profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileBloc(this.profileUseCase) : super(ProfileInitial()) {
    on<ProfileInfoEvent>(
      _getProfileInfo,
    );
  }

  FutureOr<void> _getProfileInfo(
      ProfileInfoEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final model = await profileUseCase(
        NoParams(),
      );
      emit(
        ProfileLoaded(
          model: model,
        ),
      );
    } catch (e) {
      emit(
        ProfileError(
          errorText: e.toString(),
        ),
      );
    }
  }
}
