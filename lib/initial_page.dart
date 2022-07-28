import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/task.dart';

class InitialPage extends StatefulWidget {
  final String title;

  const InitialPage({Key? key, required String this.title}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool booster = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            booster = true;
          });
        },
        child: Icon(Icons.local_fire_department_outlined),
      ),
      body: ListView(
        children: [
          const Task(
            description: 'Aprender flutter',
            photo:
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
            difficulty: 2,
          ),
          const Task(
            description: 'Meditar',
            photo:
                'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
            difficulty: 1,
          ),
          const Task(
            description: 'Jogar CS',
            photo: 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
            difficulty: 5,
          ),
        ],
      ),
    );
  }
}
