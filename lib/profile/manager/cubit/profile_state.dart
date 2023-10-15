part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class StateIsLoading extends ProfileState {}

final class UpdateProfileIsSuccessfult extends ProfileState {
  // final List<ProfileModel> profileModel;

  //  UpdateProfileIsSuccessfult({required this.profileModel});
}

final class UpdateProfileIsFailuer extends ProfileState {
  final String erroMessage;

  UpdateProfileIsFailuer({required this.erroMessage});
}


final class GetAllUserIsFailuer extends ProfileState {
  final String erroMessage;

  GetAllUserIsFailuer({required this.erroMessage});
}


final class GetAllUserIsSuccessfuly extends ProfileState {
  final List<ProfileModel>allUsers;

  GetAllUserIsSuccessfuly({required this.allUsers});
}

final class NotFloundUsers extends ProfileState {}
