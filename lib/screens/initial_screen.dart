import 'package:first_app/components/task.dart';
import 'package:first_app/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.add_task_rounded),
        title: const Text('Flutter Tasks'),
      ),
      body: ListView(
        children: const [
          Task(
            'Aprender Flutter',
            'assets/images/flutter.png',
            4,
          ),
          Task(
            'Aprender React',
            'assets/images/react.png',
            1,
          ),
          Task(
            'Aprender Node',
            'assets/images/node.png',
            3,
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
