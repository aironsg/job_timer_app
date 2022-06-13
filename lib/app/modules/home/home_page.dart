import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:job_timer/app/modules/home/widgets/header_project_menu.dart';
import 'package:job_timer/app/modules/home/widgets/project_tile.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  final LoginController? loginController;
   HomePage({super.key, required this.controller,this.loginController} );

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        AsukaSnackbar.alert('erro ao buscar projetos');
      },
      child: Scaffold(
        drawer:const   Drawer(
          child:SafeArea(
            child: ListTile(//fazendo mudança aqui
              title: Text(''),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Projetos'),
                expandedHeight: 100,
                toolbarHeight: 100,
                centerTitle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: HeaderProjectMenu(controller: controller),
                pinned: true,
              ),
              BlocSelector<HomeController, HomeState, bool>(
                  bloc: controller,
                  selector: (state) => state.status == HomeStatus.loading,
                  builder: (context, showLoading) {
                    return SliverVisibility(
                      visible: showLoading,
                      sliver: const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        ),
                      ),
                    );
                  }),
              BlocSelector<HomeController, HomeState, List<ProjectModel>>(
                  bloc: controller,
                  selector: (state) => state.projects,
                  builder: (context, projects) {
                    return SliverList(
                      delegate: SliverChildListDelegate(projects
                          .map(
                            (project) => ProjectTile(projectModel: project))
                          .toList()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
