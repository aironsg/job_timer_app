import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/service/auth/auth_service.dart';
import 'package:job_timer/app/service/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';

part 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  ProjectService _service;
  AuthService _authService;
  HomeController(
      {required AuthService authService, required ProjectService service})
      : _authService = authService,
        _service = service,
        super(HomeState.inital());

  Future<void> loadProjects() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final projects = await _service.findByStatus(state.projectFilter);
      emit(state.copyWith(status: HomeStatus.complete, projects: projects));
    } catch (e, s) {
      log('erro ao buscar projetos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> filter(ProjectStatus status) async {
    emit(state.copyWith(status: HomeStatus.loading, projects: []));
    final projects = await _service.findByStatus(status);
    emit(state.copyWith(
      status: HomeStatus.complete,
      projects: projects,
      projectFilter: status,
    ));
  }

  void updateList() => filter(state.projectFilter);
  Future<void> logout() => _authService.signOut();
    
  
}
