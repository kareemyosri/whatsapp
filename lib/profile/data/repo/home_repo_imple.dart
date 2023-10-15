import 'dart:async';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../util/app_const.dart';
import '../../../util/error.dart';
import 'home_repo.dart';

class HomeRepoImple implements HomeRepo {
  CollectionReference profile =
      FirebaseFirestore.instance.collection(AppConst.collectionProfile);

 
  @override
  Future<Either<Failuer, bool >> storedateFirebase(
      {required String name, required String id, File? filephoto}) async {
    try {
      String? urlImage;
      if (filephoto != null) {
        var result = await _uploadImage(filephoto);
        result.fold((left) {
          return Left(ServerFailuer(left.toString()));
        }, (right) => urlImage = right);
        var resultaddDate =  _addDataInFirebase(name, id, urlImage!);
        resultaddDate.fold(
          (left) {
            return Left(ServerFailuer(left.erroMessage));
          },
          ((right) {}),
        );
      } else {
        var resultaddDate =  _addDataInFirebase(name, id,
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFFRvDjuy8BDiyWROIuIhgtHgneqizbYabMA&usqp=CAU');

        resultaddDate.fold(
          (left) {
            return Left(ServerFailuer(left.erroMessage));
          },
          ((right) {}),
        );
      }
    return const Right(true);
   
    } on Exception catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }



Either<Failuer, bool> _addDataInFirebase(
    String name, String id, String urlImage)  {

  try {
     profile.add({
      'name': name,
      'id': id,
      'photo': urlImage
    });
    return const Right(true);
  } catch (error) {
    print('iam in failuer');
    return Left(ServerFailuer(error.toString()));
  }
}

  Future<Either<Failuer, String>> _uploadImage(File photo) async {
    final imagNmae = basename(photo.path);

    var mountainsRef = FirebaseStorage.instance.ref(imagNmae);
    try {
      await mountainsRef.putFile(photo);
      return Right(await mountainsRef.getDownloadURL());
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  // @override
  // Future<Either<Failuer, List<ProfileModel>>> getAllUser() async {
  //   try {
  //     QuerySnapshot querySnapshot = await profile.get();
  //     List<ProfileModel> allprofile = querySnapshot.docs
  //         .map((doc) => ProfileModel.formfirebase(doc))
  //         .toList();
  //     return Right(allprofile);
  //   } catch (e) {
  //     return Left(ServerFailuer(e.toString()));
  //   }
  // }
}















  // @override
  // Future<Either<Failuer, List<ProfileModel>>> storedateFirebase(
  //     {required String name, required String id, File? filephoto}) async {
  //   try {
  //     String? urlImage;
  //     if (filephoto != null) {
  //       var result = await _uploadImage(filephoto);
  //       result.fold((left) {
  //         return Left(ServerFailuer(left.toString()));
  //       }, (right) => urlImage = right);
  //       var resultaddDate =  _addDataInFirebase(name, id, urlImage!);
  //       resultaddDate.fold(
  //         (left) {
  //           return Left(ServerFailuer(left.erroMessage));
  //         },
  //         ((right) {}),
  //       );
  //     } else {
  //       var resultaddDate =  _addDataInFirebase(name, id,
  //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFFRvDjuy8BDiyWROIuIhgtHgneqizbYabMA&usqp=CAU');

  //       resultaddDate.fold(
  //         (left) {
  //           return Left(ServerFailuer(left.erroMessage));
  //         },
  //         ((right) {}),
  //       );
  //     }
  //     var resultGetAllUser = await getAllUser();

  //     return resultGetAllUser.fold(
  //       (left) => Left(ServerFailuer(left.erroMessage)),
  //       (right) => Right(right),
  //     );
  //   } on Exception catch (e) {
  //     return Left(ServerFailuer(e.toString()));
  //   }
  // }
