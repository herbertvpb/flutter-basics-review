// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:first_app/difficult_stars.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Flutter Tasks'),
        ),
        body: AnimatedOpacity(
          opacity: opacity ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: ListView(
            children: [
              Task(
                'Aprender Flutter',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                4,
              ),
              Task(
                'Aprender React',
                'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png',
                1,
              ),
              Task(
                'Aprender Node',
                'https://img1.gratispng.com/20180425/xeq/kisspng-node-js-javascript-web-application-express-js-comp-5ae0f84de7b809.1939946215246930699491.jpg',
                3,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacity = !opacity;
            });
          },
          child: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String description;
  final String imageUrl;
  final int difficulty;

  const Task(this.description, this.imageUrl, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.description,
                              style: TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child:
                                DifficultyStars(difficulty: widget.difficulty),
                          )
                        ],
                      ),
                      Container(
                          width: 72,
                          height: 72,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  level++;
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_drop_up),
                                  Text(
                                    'UP',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.difficulty > 0)
                              ? (level / widget.difficulty) / 10
                              : 1,
                        ),
                      ),
                      Text(
                        'Nível: $level',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
