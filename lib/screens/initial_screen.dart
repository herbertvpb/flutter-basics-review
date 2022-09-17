import 'package:first_app/components/task.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Flutter Tasks'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
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
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
