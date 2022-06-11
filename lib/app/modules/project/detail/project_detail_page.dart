import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail.appBar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_pie_chart.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_task_tile.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectDetailAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: ProjectPieChart(),
                ),
                ProjectTaskTile(),
               
      
              ],
            ),
          ),
        ],
      ),
    );
  }
}
