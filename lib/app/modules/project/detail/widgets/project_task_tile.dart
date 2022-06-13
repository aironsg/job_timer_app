import 'package:flutter/material.dart';
import 'package:job_timer/app/view_models/project_tasks.model.dart';

class ProjectTaskTile extends StatelessWidget {

  final ProjectTasksModel task;
  const ProjectTaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            task.name,
            style:const  TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Duração',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                const TextSpan(text: '    '),
                 TextSpan(
                  text: '${task.duration}h',
                  style:const  TextStyle(
                    color: Colors.black,
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
