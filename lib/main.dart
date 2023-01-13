import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBrain storyBrain = StoryBrain();
void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: DestiniPage(),
          ),
        ),
      ),
    );
  }
}

class DestiniPage extends StatefulWidget {
  const DestiniPage({Key? key}) : super(key: key);

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                storyBrain.getStory(),
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  storyBrain.nextStory(1);
                });
              },
              child: Text(
                storyBrain.getChoice1(),
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  setState(() {
                    storyBrain.nextStory(2);
                  });
                },
                child: Text(
                  storyBrain.getChoice2(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
