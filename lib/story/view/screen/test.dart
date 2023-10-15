import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/story/cubit/story_cubit.dart';
import 'package:whatsapp/story/view/screen/story_details_screen.dart';
import 'package:story_view/story_view.dart';

import 'add_story_text_screen.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late StoryCubit cubit;


  @override
  void initState() {
    super.initState();
    cubit=StoryCubit.get(context);
    // Firebase.initializeApp(); // Initialize Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
      ),
      body: Column(

        children: [
          ListTile(
            leading: const Text('Add Story'),
            trailing: Center(
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async{

                      cubit.uploadImage(context);

                    },
                    child: const Icon(Icons.photo_library_outlined),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          StoryTextMakerScreen()
                      ));


                    },
                    child: const Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('stories').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const Text('No data available');
              }

              final stories = snapshot.data?.docs;

              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: stories?.length,
                  itemBuilder: (context, index) {
                    final storyData = stories?[index].data();
                    final userStoriesCollection =
                    stories?[index].reference.collection('1');

                    return StreamBuilder<QuerySnapshot>(
                      stream: userStoriesCollection?.snapshots(),
                      builder: (context, userStoriesSnapshot) {
                        if (userStoriesSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        if (userStoriesSnapshot.hasError) {
                          return Text('Error: ${userStoriesSnapshot.error}');
                        }

                        if (!userStoriesSnapshot.hasData) {
                          return const Text('No user stories available');
                        }

                        final userStories = userStoriesSnapshot.data?.docs;

                        return CustomListTile(userStories: userStories);
                      },
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future<void> _uploadStoryToFirebase(BuildContext context, String storyPath) async {
    final storageReference = FirebaseStorage.instance.ref().child('media/${storyPath}');
    final storageUploadTask = storageReference.putFile(File(storyPath));

    try {
      await storageUploadTask.whenComplete(() {
        print('Story uploaded to Firebase Storage.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Story uploaded to Firebase')),
        );
      });
    } catch (error) {
      print('Error uploading story: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload story to Firebase')),
      );
    }
  }
}

class CustomListTile extends StatelessWidget {
  final List<QueryDocumentSnapshot>? userStories;

  CustomListTile({required this.userStories});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(userStories?.first['storyURL']),
      ),
      title: Text(userStories?.first['name']),
      onTap: () {
        final storyItems = userStories?.map((userStory) {
          final userStoryData = userStory.data() as Map<String, dynamic>;
          final imageURL = userStoryData['storyURL'] as String; // Replace with your field name
          final type = userStoryData['storyType'] as String; // Replace with your field name
         // final name= userStoryData['name'] as String;
          // Create a StoryController
          final controller = StoryController();
          late StoryItem storyItem;

          if(type=='image'){
            // Create a StoryItem with the provided controller and URL
             storyItem = StoryItem.pageImage(
              controller: controller, // Provide the controller
              url: imageURL, // Use the Image.network constructor to load the image
            );
           // userStoryItems.add(storyItem);

          }

            // Create a text StoryItem for the caption
             else{
            storyItem = StoryItem.text(
              title: imageURL, // Use the type as the caption
              backgroundColor: Colors.blue, // Customize the background color
            );
          }

          return storyItem;
        }).toList();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StoryDetailScreen(storyItems: storyItems??[]),
        ));
      },
    );
  }
}
