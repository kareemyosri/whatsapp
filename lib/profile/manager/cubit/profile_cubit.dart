import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../data/model/profile_model.dart';
import '../../data/repo/home_repo_imple.dart';
import '../../screens/widget/pick_image.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._homeRepoImple) : super(ProfileInitial());

  final HomeRepoImple _homeRepoImple;
  List<ProfileModel> allUsers = [];
  late ProfileModel myProfile;
  Future<void> updateProfile({required String name, required String id,required String phoneNumber}) async {
    emit(StateIsLoading());
    var result = await _homeRepoImple.storedateFirebase(
        name: name, id: id, filephoto: image,phoneNumber: phoneNumber);

    result.fold((left) {
      emit(UpdateProfileIsFailuer(
          erroMessage: 'oops there is problem ${left.erroMessage}'));
    }, (right) {
    
      emit(UpdateProfileIsSuccessfult());
    });
  }

// Future<void>getAllUsers()async{
//   emit(StateIsLoading());
//  var result = await  _homeRepoImple.getAllUser();
//  result.fold((left) => emit(GetAllUserIsFailuer(erroMessage: left.erroMessage)), (right) {
//   for(int i = 0;i<right.length;i++){
//     right[i].id == FirebaseAuth.instance.currentUser!.uid ?myProfile = right[i] : allUsers.add(right[i]);
//   }
//   allUsers.isNotEmpty?
//    emit(GetAllUserIsSuccessfuly(allUsers: allUsers)):emit(NotFloundUsers());
//  });
}
