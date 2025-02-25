import 'package:example/game/stories/util/story_cicle.dart';
import 'package:flutter/material.dart';
import 'storypage.dart';

class HomeStoryPage extends StatefulWidget {
  const HomeStoryPage({Key? key}) : super(key: key);

  @override
  _HomeStoryPageState createState() => _HomeStoryPageState();
}

class _HomeStoryPageState extends State<HomeStoryPage> {
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('S T O R I E S'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return StoryCircle(
                  function: _openStory,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}