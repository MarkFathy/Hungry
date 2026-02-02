part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {} // فقط للعرض بعد getProfile

final class ProfileUpdatedSuccessState extends ProfileState {
  final ProfileEntity profile;
  const ProfileUpdatedSuccessState(this.profile);

  @override
  List<Object> get props => [profile];
}

final class ProfileFailureState extends ProfileState {
  final String message;
  const ProfileFailureState(this.message);

  @override
  List<Object> get props => [message];
}

final class ProfileEditModeState extends ProfileState {
  final bool isEditing;
  const ProfileEditModeState(this.isEditing);

  @override
  List<Object> get props => [isEditing];
}

final class ProfileImageUpdatedState extends ProfileState {
  final File imageFile;
  const ProfileImageUpdatedState(this.imageFile);

  @override
  List<Object> get props => [imageFile];
}

final class ProfileSavingState extends ProfileState {}

// Logout
final class LogoutLoadingState extends ProfileState {}
final class LogoutSuccessState extends ProfileState {}
final class LogoutFailureState extends ProfileState {
  final String message;
  const LogoutFailureState(this.message);

  @override
  List<Object> get props => [message];
}
