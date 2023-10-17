import 'dart:io';

import 'package:either_dart/either.dart';

import '../../../util/error.dart';

abstract class HomeRepo {
  //Future<Either<Failuer, List<ProfileModel>>> getAllUser();
  // Future<Either<Failuer, List<ProfileModel>>> storedateFirebase({required String name,required String id, File? filephoto});
  Future<Either<Failuer, bool>> storedateFirebase({required String name,required String id, required String phoneNumber,File? filephoto});

}
