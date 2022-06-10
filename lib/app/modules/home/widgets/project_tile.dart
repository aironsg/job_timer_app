import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';

import '../../../view_models/project_model.dart';

class ProjectTile extends StatelessWidget {
  final ProjectModel projectModel;
  const ProjectTile({super.key, required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 90),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 4,
          ),
        ),
        child: Column(
          children: [
            _ProjectName(projectModel: projectModel),
            Expanded(child: _ProjectProgress(projectModel: projectModel)),
          ],
        ));
  }
}

class _ProjectName extends StatelessWidget {
  final ProjectModel projectModel;
  const _ProjectName({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            projectModel.name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Job_timer_icons.angle_double_right,
            color: Theme.of(context).primaryColor,
            size: 25,
          ),
        ],
      ),
    );
  }
}

class _ProjectProgress extends StatelessWidget {
  final ProjectModel projectModel;
  const _ProjectProgress({required this.projectModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300]!,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}