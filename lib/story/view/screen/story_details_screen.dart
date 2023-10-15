import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';


class StoryDetailScreen extends StatefulWidget {
  final String? imageURL;
  final String? type;
  final List<StoryItem?> storyItems;
  const StoryDetailScreen({super.key,  this.imageURL,  this.type, required this.storyItems});

  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      // (widget.type=='text')?
      // StoryView(
      //
      //   storyItems: [
      //
      //       StoryItem.text(
      //         title: widget.imageURL,
      //         backgroundColor: Colors.blue,
      //       ),
      //
      //
      //
      //
      //   ],
      //   onStoryShow: (s) {
      //     print("Showing a story");
      //   },
      //   onComplete: () {
      //     print("Completed a cycle");
      //   },
      //   progressPosition: ProgressPosition.top,
      //   repeat: false,
      //   controller: storyController,
      // ) :  (widget.type=='image')?
      //
      // StoryView(
      //
      //   storyItems: [
      //
      //     StoryItem.pageImage(
      //       url: widget.imageURL,
      //       caption: "Hello, from the other side2",
      //       controller: storyController,
      //     ),
      //
      //
      //   ],
      //   onStoryShow: (s) {
      //     print("Showing a story");
      //   },
      //   onComplete: () {
      //     print("Completed a cycle");
      //   },
      //   progressPosition: ProgressPosition.top,
      //   repeat: false,
      //   controller: storyController,
      // ) :  StoryView(
      //
      //   storyItems: [
      //
      //     StoryItem.pageVideo(
      //       widget.imageURL,
      //       caption: "Hello, from the other side2",
      //       controller: storyController,
      //     ),
      //
      //
      //   ],
      StoryView(
        storyItems: widget.storyItems, controller: storyController,

        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
      )
    );
  }
}
