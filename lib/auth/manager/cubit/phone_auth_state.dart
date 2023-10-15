part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneNumberValid extends PhoneAuthState {}

final class PhoneNumberINValid extends PhoneAuthState {
  final String erroeMessage;

  PhoneNumberINValid({required this.erroeMessage});
}

final class PhoneOTPValid extends PhoneAuthState {}

final class PhoneOTPInValid extends PhoneAuthState {
     final String erroeMessage;

  PhoneOTPInValid({required this.erroeMessage});

}


final class StateIsLoading extends PhoneAuthState {}
