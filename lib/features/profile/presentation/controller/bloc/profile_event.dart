part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileInfoEvent extends ProfileEvent {}

final class EditProfileInfoEvent extends ProfileEvent {
  final String firstName;

  EditProfileInfoEvent({required this.firstName});
}
