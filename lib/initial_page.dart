import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InitialPage extends StatefulWidget {
  final String title;

  const InitialPage({Key? key, required String this.title}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      backgroundColor: Colors.blueGrey[50],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        child: Icon(!isVisible ? Icons.visibility : Icons.visibility_off),
      ),
      body: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: ListView(
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
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String description;
  final String photo;
  final int difficulty;

  const Task({
    Key? key,
    required String this.description,
    required String this.photo,
    required int this.difficulty,
  }) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    final stars = <Widget>[];
    for (var i = 1; i <= 5; i++) {
      stars.add(
        new Icon(
          Icons.star,
          size: 15,
          color: widget.difficulty >= i ? Colors.amber : Colors.amber[100],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Stack(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width - 16,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 120, 8, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: Colors.black,
                      value: (widget.difficulty > 0)
                          ? (nivel / widget.difficulty) / 10
                          : 1,
                    ),
                  ),
                  Text(
                    'Nível $nivel',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width - 16,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 80,
                  height: 150,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          this.widget.description,
                          style: const TextStyle(
                            fontSize: 20.0,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: stars,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nivel++;
                        });
                      },
                      child: Column(children: [
                        const Icon(Icons.arrow_drop_up),
                        const Text('Lvl Up'),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
