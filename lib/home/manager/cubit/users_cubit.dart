import 'package:bloc/bloc.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../profile/data/model/profile_model.dart';
import '../../../util/app_const.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  List<ProfileModel> allUseres = [];
  Future<void> getAllUsers() async {
    FirebaseFirestore.instance
        .collection(AppConst.collectionProfile)
        .snapshots()
        .listen(
      (event) {
        for (int i = 0; i < event.docs.length; i++) {
          if (event.docs[i]['id'] != FirebaseAuth.instance.currentUser!.uid) {
            allUseres.add(ProfileModel.formfirebase(event.docs[i]));
          }
        }

        if (allUseres.isEmpty) {
          emit(UsersIsEmpty());
        }
        emit(GetAllUserSuccess(allUsers: allUseres));
      },
    );
  }

  void sendMessage(
      {required String idUser,
      required String message,
      required String uid,
      required String date}) {
    List<String> data = [uid, idUser];
    data.sort();
    String chatId = data.join("_");

    CollectionReference messageDb =
        FirebaseFirestore.instance.collection(chatId);

    try {
      messageDb.add({"message": message, "date": date, "uid": uid});
      print('don');
      emit(MessageSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(
        MessageFaliuer(erroMessage: 'ther is problem ${e.toString()}'),
      );
    }
  }

  
}
