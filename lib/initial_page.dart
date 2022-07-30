import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Wallet.dart';
import 'package:flutter_application_1/task.dart';

class InitialPage extends StatefulWidget {
  final String title;

  const InitialPage({Key? key, required String this.title}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool booster = true;
  Wallet wallet = Wallet();

  @override
  Widget build(BuildContext context) {
    double wallet = 0;

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
            description: 'Formatar um PC',
            photo:
                'https://i.kym-cdn.com/photos/images/facebook/000/569/491/fa8.png',
            difficulty: 1,
            reward: 70,
          ),
          const Task(
            description: 'Criar um logo',
            photo:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJRck59aIloaD8Ca6C_xm-AesB6u0ZRgFb6y7WVHsNQNRb7i9XOoWU5PFAlKs89V_CS8M&usqp=CAU',
            difficulty: 1,
            reward: 300,
          ),
          const Task(
            description: 'Jogar CS',
            photo: 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
            difficulty: 5,
            reward: 1000,
          ),
        ],
      ),
    );
  }
}
