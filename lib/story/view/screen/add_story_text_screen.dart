import 'package:flutter/material.dart';

class StoryTextMakerScreen extends StatefulWidget {
  @override
  _StoryTextMakerScreenState createState() => _StoryTextMakerScreenState();
}

class _StoryTextMakerScreenState extends State<StoryTextMakerScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,

        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Handle sending the story.
              final enteredText = textController.text;
              print('Sending story: $enteredText');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.transparent,

              ),
              child: Center(
                child: TextField(
                  controller: textController,
                  textAlign: TextAlign.center,
                  minLines: 1,
                  maxLines: 5,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,


                  ),

                  decoration: const InputDecoration(

                    contentPadding: EdgeInsets.all(12.0),
                    hintText: 'Type your story here...',
                    hintStyle: TextStyle(
                      color: Colors.white
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}