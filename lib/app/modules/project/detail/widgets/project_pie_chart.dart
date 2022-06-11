import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectPieChart extends StatelessWidget {
  final int projectEstimate;
  final int totalTask;
  const ProjectPieChart(
      {required this.projectEstimate, required this.totalTask, super.key});

  @override
  Widget build(BuildContext context) {

    final residual = (projectEstimate - totalTask);
    final theme = Theme.of(context);
    // ignore: prefer_const_constructors
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: totalTask.toDouble(),
                  color: theme.primaryColor,
                  showTitle: true,
                  title: '${totalTask}h',
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                PieChartSectionData(
                  value: residual.toDouble(),
                  color: theme.primaryColorLight,
                  showTitle: true,
                  title: '${residual}h',
                  titleStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${projectEstimate}h',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
