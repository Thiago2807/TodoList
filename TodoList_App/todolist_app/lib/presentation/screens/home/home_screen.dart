import 'package:flutter/material.dart';

import 'components/next_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .01,
          horizontal: size.height * .03,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NextTaskComponent(),
            Text("Lista das tarefas e botão para adicionar uma nova tarefa"),
          ],
        ),
      ),
    );
  }
}
