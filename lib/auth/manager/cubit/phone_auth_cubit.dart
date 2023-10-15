import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());

  late String verificationId;
   String? codeCountry;
   String? smscode;

  Future<void> phoneAuth(
      { required String phoneNumber}) async {
    emit(StateIsLoading());
    codeCountry = codeCountry ??'+20';
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$codeCountry$phoneNumber',
      timeout:const Duration(seconds: 100),
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {
        print('codeAutoRetrievalTimeout');
      },
    );
  }

  Future<void> enterOTP({required }) async {
    emit(StateIsLoading());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: smscode!);
    await _signIn(credential);
  }

  Future<void> _verificationCompleted(PhoneAuthCredential credential) async {
    await _signIn(credential);
  }

  void _verificationFailed(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      emit(PhoneNumberINValid(
          erroeMessage: 'The provided phone number is not valid.'));
    } else {
      emit(PhoneNumberINValid(erroeMessage: 'There is problem '));
    }
  }

  void _codeSent(String verificationId, int? resendToken) {
    this.verificationId = verificationId;
    emit(PhoneNumberValid());
  }

  Future<void> _signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOTPValid());
    } catch (e) {
      print(e.toString());
    emit( PhoneOTPInValid(erroeMessage: e.toString()));
    }
  }

}
