import 'package:flutter/material.dart';

class ProjectTaskTile extends StatelessWidget {
  const ProjectTaskTile({super.key});

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
          const Text(
            'Nome da task',
            style: TextStyle(
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
                const TextSpan(
                  text: '4h',
                  style: TextStyle(
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
