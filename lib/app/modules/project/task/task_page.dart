import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_with_loading.dart';
import 'package:job_timer/app/modules/project/task/controller/task_controller.dart';
import 'package:validatorless/validatorless.dart';

class TaskPage extends StatefulWidget {
  final TaskController controller;
  const TaskPage({super.key, required this.controller});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _durationEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _durationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<TaskController, TaskStatus>( 
      bloc: widget.controller,
      listener: (context, state) {
       if(state == TaskStatus.sucess){
        Navigator.pop(context);
       }else if(state == TaskStatus.failure){
        AsukaSnackbar.alert('Erro ao Salvar Tarefa').show();
       }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Criar Nova Tarefa',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  decoration: const InputDecoration(
                    label: Text('Nome da Tarefa'),
                  ),
                  validator: Validatorless.required('Nome Obrigatório'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _durationEC,
                  decoration: const InputDecoration(
                    label: Text('Duração da Tarefa'),
                  ),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Duração Obrigatória'),
                      Validatorless.number('Somente Números'),
                    ],
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 49,
                  child: ButtonWithLoading<TaskController, TaskStatus>(
                    bloc: widget.controller,
                    selector: (state) => state == TaskStatus.loading,
                    label: 'Salvar',
                    onPressed: () {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        widget.controller.register(_nameEC.text, int.parse(_durationEC.text));
                      }
                    },
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
