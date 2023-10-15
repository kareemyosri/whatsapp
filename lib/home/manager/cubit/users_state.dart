part of 'users_cubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}


final class GetAllUserSuccess extends UsersState {
  final List<ProfileModel>allUsers;

  GetAllUserSuccess({required this.allUsers});
}


final class GetAllUserFailuer extends UsersState {
  final String errorMessage;

  GetAllUserFailuer({required this.errorMessage});
}

final class StateIsLoading extends UsersState {}

final class UsersIsEmpty extends UsersState {}




final class MessageSuccess extends UsersState {
  // final List<MessageModl>messageModel;

  // MessageSuccess({required this.messageModel});
}
final class MessageFaliuer extends UsersState {
  final String erroMessage;

  MessageFaliuer({required this.erroMessage});
}
