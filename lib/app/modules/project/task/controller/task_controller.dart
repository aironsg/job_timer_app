import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:job_timer/app/service/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';
import 'package:job_timer/app/view_models/project_tasks.model.dart';

part 'task_state.dart';

class TaskController extends Cubit<TaskStatus> {
  late ProjectModel _projectModel;
  final ProjectService _service;
  
  TaskController({required ProjectService service})
      : _service = service,
        super(TaskStatus.initial);

  void setProject(ProjectModel projectModel) => _projectModel = projectModel;

  Future<void> register(String name, int duration) async {
    try {
      emit(TaskStatus.loading);
      final task = ProjectTasksModel(name: name, duration: duration);
      await _service.addTask(_projectModel.id!, task);
      emit(TaskStatus.sucess);
    } catch (e, s) {
      log('erro ao cadastrar tarefa', error: e, stackTrace: s);
      emit(TaskStatus.failure);
    }
  }
}
