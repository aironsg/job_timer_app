import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/service/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';
part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  ProjectService _service;
  ProjectRegisterController({required ProjectService service})
      : _service = service,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    try{
      emit(ProjectRegisterStatus.loading);
    final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        tasks: []);

        await _service.register(project);
        await Future.delayed(Duration(seconds: 1));
        emit(ProjectRegisterStatus.sucess);
    }catch(e,s){
      log('erro ao salvar project', error: e, stackTrace: s);
    }
  }
}
