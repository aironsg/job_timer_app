import 'package:flutter/material.dart';

class ProjectDetailAppBar extends SliverAppBar {
  ProjectDetailAppBar({super.key})
      : super(
          expandedHeight: 100,
          pinned: true,
          toolbarHeight: 100,
          title: const Text('Projeto X'),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          )),
          flexibleSpace: Align(
            alignment: Alignment(0, 1.6),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 48,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('10 tasks', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),),
                              _NewTasks(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
}



class _NewTasks extends StatelessWidget {
  const _NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child:const  Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        const Text(
          'Adicionar Nova Tarefa',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

