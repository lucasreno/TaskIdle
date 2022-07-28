import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
  int experience = 0;

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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('XP:'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: LinearProgressIndicator(
                          color: Colors.black,
                          value: (widget.difficulty > 0)
                              ? (experience / widget.difficulty) / 10
                              : 1,
                        ),
                      ),
                    ],
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
                          experience++;
                          if ((experience / widget.difficulty) / 10 >= 1) {
                            experience = 0;
                            nivel++;
                          }
                        });
                      },
                      child: Column(children: [
                        const Icon(Icons.arrow_drop_up),
                        const Text('Treinar'),
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
