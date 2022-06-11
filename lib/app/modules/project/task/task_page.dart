import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/project/task/controller/task_controller.dart';

class TaskPage extends StatelessWidget {
  final TaskController controller;
  const TaskPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Criar Nova Tarefa',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text('Nome da Tarefa'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Duração da Tarefa'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Adicionar', style: TextStyle(
                  fontSize: 20,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
