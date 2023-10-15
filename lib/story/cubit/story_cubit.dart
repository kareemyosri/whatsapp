import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:story_maker/story_maker.dart';
import 'package:video_player/video_player.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial());

  static StoryCubit get(context)=>BlocProvider.of(context);
  // PlatformFile? pickedFile;
  //
  // VideoPlayerController? videoController;
  // Future<void> pickMedia(
  // ) async {
  //   emit(StoryLoading());
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     await Permission.storage.request();
  //     status = await Permission.storage.status;
  //     if (!status.isGranted) {
  //       emit(StoryError());
  //       // Handle permission denied
  //       return;
  //     }
  //   }
  //
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'jpeg', 'png'],
  //   );
  //
  //   if (result == null) {
  //     return;
  //   }
  //
  //   final path = result.files.single.path;
  //   final isVideo = path?.toLowerCase().endsWith('.mp4');
  //   pickedFile = result.files.single;
  //
  //   if (isVideo!) {
  //     // Picked a video
  //     //videoController?.dispose();
  //     videoController = VideoPlayerController.file(File(path!))
  //       ..initialize().then((_) {
  //           // Update the _pickedFile variable to the video file
  //           pickedFile = result.files.single;
  //
  //       });
  //   }
  //   emit(StorySuccess());
  // }


  Future<String> uploadImage(BuildContext context) async {
    emit(StoryLoading());

    await [Permission.photos, Permission.storage].request();

    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file == null) {
      emit(StoryError());
      return '';
    }

    final editedFile = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StoryMaker(
          filePath: file.path,
        ),
      ),
    );

    final fileName = editedFile.path.split('/').last;
    final ref = FirebaseStorage.instance.ref().child('media/$fileName');
    await ref.putFile(editedFile);

    final downloadURL = await ref.getDownloadURL();
    print(downloadURL);
    emit(StorySuccess());


    return downloadURL;
  }



  // final FirebaseStorage _storage = FirebaseStorage.instance;
  // Future<void> uploadToFirebase() async {
  //   if (pickedFile == null) {
  //     return; // No file to upload
  //   }
  //
  //   final ref = _storage.ref().child('media/${pickedFile!.name}');
  //   await ref.putFile(File(pickedFile!.path!));
  //
  //   // You can now handle the Firebase Storage URL if needed
  //   final downloadURL = await ref.getDownloadURL();
  //
  //
  //
  //   print("File uploaded to Firebase Storage: $downloadURL");
  // }


}
