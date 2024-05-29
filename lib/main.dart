import 'package:flutter/material.dart';
import 'storyBrain.dart';

StoryBrain storyBrain = StoryBrain();
void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Storypage(),
    );
  }
}

class Storypage extends StatefulWidget {
  const Storypage({super.key});

  @override
  State<Storypage> createState() => _StorypageState();
}

class _StorypageState extends State<Storypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(1);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice1(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonshouldBeivisible(),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
