import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/service/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';

part 'project_detail_state.dart';

class ProjectDetailController extends Cubit<ProjectDetailState> {
  final ProjectService _service;

  ProjectDetailController({required ProjectService service})
      : _service = service,
        super(const ProjectDetailState.initial());

  void setProject(ProjectModel projectModel) {
    _sortTasks(projectModel);
    emit(
      state.copyWith(
          projectModel: projectModel, status: ProjectDetailStatus.complete),
    );
  }

  void updateProject() async {
    final project = await _service.findById(state.projectModel!.id!);
    _sortTasks(project);
    emit(state.copyWith(projectModel: project, status: ProjectDetailStatus.complete));
  }

  Future<void> finishProject() async {
    try {
      emit(state.copyWith(status: ProjectDetailStatus.loading));
      final projectId = state.projectModel!.id!;
      await _service.finish(projectId);
      updateProject();
    } catch (e) {
      emit(state.copyWith(status: ProjectDetailStatus.failure));
    }
  }

  void _sortTasks(ProjectModel projectModel){
    projectModel.tasks.sort((a, b) => b.id!.compareTo(a.id!),);
  }
}
