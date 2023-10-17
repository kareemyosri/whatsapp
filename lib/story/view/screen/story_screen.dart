
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:whatsapp/story/view/screen/story_details_screen.dart';

import '../../../util/app_router.dart';
import '../../../util/color.dart';
import '../../cubit/story_cubit.dart';
import '../widget/bottom_to_generat_story.dart';
import '../widget/my_story.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomBottomToGeneratStory(
                  icon: Icons.edit_outlined,
                  color: const Color(0xff29333B),
                  colorIcon: Colors.white,
                  onTap: () {
                    print('ahmed');
                    Navigator.pushNamed(
                        context, AppRouter.storyTextMakerScreen);
                  }),
              CustomBottomToGeneratStory(
                  icon: Icons.camera_alt,
                  color: tabColor,
                  colorIcon: const Color(0xff081518),
                  onTap: () {
                    print('mohamed');
                    BlocProvider.of<StoryCubit>(context).uploadImage(context);
                  }),
              SizedBox(height: 16.h)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('stories').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('i am in errors');
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData) {
                print('i am in empty');

                return Center(
                    child: Text(
                  'No data available',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.red),
                ));
              }
              final stories = snapshot.data?.docs;
              if (snapshot.data!.docs.length == 0) {
                return const MyStory();
              } else {

                final myStory = stories?.where((story) => story.id == FirebaseAuth.instance.currentUser!.uid).toList();
                print(myStory);
                // Get the other friend stories.
                final friendStories = stories?.where((story) => story.id != FirebaseAuth.instance.currentUser!.uid).toList();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Visibility(
                        visible: myStory!.isEmpty,
                          child: const MyStory()),
                      Visibility(
                        visible: myStory.isNotEmpty,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:myStory.length,
                            itemBuilder: (context, index) {
                              final userStoriesCollection =
                              myStory?[index].reference.collection('1');
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
                                    print('i am in my STORY ');
                                    // return  const MyStory();
                                  }

                                  final userStories = userStoriesSnapshot.data?.docs;
                                    return  CustomListTile(userStories: userStories);
                                },
                              );
                            }
                        ),
                      ),

                      Text(
                        'Recent updates',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: friendStories?.length,
                          itemBuilder: (context, index) {
                            final userStoriesCollection =
                            friendStories?[index].reference.collection('1');
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
                                  print('i am in my STORY ');
                                  // return  const MyStory();
                                }

                                final userStories = userStoriesSnapshot.data?.docs;

                                return  CustomListTile(userStories: userStories);
                                // CustomListTile(userStories: userStories);
                              },
                            );
                          }
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }


}
class CustomListTile extends StatelessWidget {
  final List<QueryDocumentSnapshot>? userStories;

  const CustomListTile({super.key, required this.userStories});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(userStories?.first['storyURL'] ?? ''),
      ),
      title: Text(userStories?.first['name'] ?? ''),
      onTap: () {
        final storyItems = userStories?.map((userStory) {
          final userStoryData = userStory.data() as Map<String, dynamic>;
          final imageURL = userStoryData['storyURL']
          as String; // Replace with your field name
          final type = userStoryData['storyType']
          as String; // Replace with your field name
          // final name= userStoryData['name'] as String;
          // Create a StoryController
          final controller = StoryController();
          late StoryItem storyItem;

          if (type == 'image') {
            // Create a StoryItem with the provided controller and URL
            storyItem = StoryItem.pageImage(
              controller: controller, // Provide the controller
              url:
              imageURL, // Use the Image.network constructor to load the image
            );
            // userStoryItems.add(storyItem);
          }

          // Create a text StoryItem for the caption
          else {
            storyItem = StoryItem.text(
              title: imageURL, // Use the type as the caption
              backgroundColor: Colors.blue, // Customize the background color
            );
          }

          return storyItem;
        }).toList();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StoryDetailScreen(storyItems: storyItems ?? []),
        ));
      },
    );
  }
}




