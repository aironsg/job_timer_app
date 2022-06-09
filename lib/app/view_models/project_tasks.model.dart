// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:job_timer/app/entities/project_task.dart';


class ProjectTasksModel {
  final int? id;
  final String name;
  final int duration;

  ProjectTasksModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTasksModel.fromEntity(ProjectTask task) {
    return ProjectTasksModel(
        id: task.id, name: task.name, duration: task.duration);
  }
}
