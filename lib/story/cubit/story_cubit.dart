import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:story_maker/story_maker.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial());
  int a = 1;

  static StoryCubit get(context) => BlocProvider.of(context);

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
    uploadStoryInFireStore(
    //    date: DateTime.now().toString(),
        urlImage: downloadURL,
        stroyType: 'image',
        name: 'mohamed');
    return '';
  }

  Future<void> uploadStoryInFireStore(
      {required String name,
      required String urlImage,
      required String stroyType,
      //required String date
      }) async {
// Create a reference to the Firestore database.
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

// Create a reference to the stories collection.
    final CollectionReference storiesCollection =
        firestore.collection('stories');

// Get the UID of the user for whom you want to create the collection.
    final String uid = FirebaseAuth.instance.currentUser!.uid;

// Create a reference to the user's stories document.
    final DocumentReference userStoriesDocument = storiesCollection.doc(uid);
userStoriesDocument.set({
  'uid': FirebaseAuth.instance.currentUser!.uid
});
// Create a reference to the 1 collection.
    final CollectionReference storyCollection =
        userStoriesDocument.collection('1');

// Create a new document in the 1 collection.
    final DocumentReference storyDocument = storyCollection.doc();

// Set the name of the story.
    storyDocument.set({
      "name": name,
      "storyURL": urlImage,
      "storyType": stroyType,
      "date": DateTime.now(),
      "uid" : FirebaseAuth.instance.currentUser!.uid
    });
  }
}
