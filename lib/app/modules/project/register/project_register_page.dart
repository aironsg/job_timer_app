import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_with_loading.dart';
import 'package:validatorless/validatorless.dart';

import 'controller/project_register_controller.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;
  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

final _formKey = GlobalKey<FormState>();
final _nameEC = TextEditingController();
final _estimateEC = TextEditingController();

@override
void dispose() {
  _nameEC.dispose();
  _estimateEC.dispose();
  //observação, recolocar o super.dispose() caso ocorra erro
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        
        switch (state) {
          case ProjectRegisterStatus.sucess:
            Navigator.pop(context);
            break;
          case ProjectRegisterStatus.failure:
            AsukaSnackbar.alert('Erro ao salvar projeto').show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Criar Novo Projeto',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameEC,
                    decoration: const InputDecoration(
                      label: Text('Nome do Projeto'),
                    ),
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _estimateEC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Estimativa de Horas'),
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Estimativa de Tempo Obrigatória'),
                      Validatorless.number('Permitido Apenas números'),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 49,
                    child: ButtonWithLoading<ProjectRegisterController, ProjectRegisterStatus>(
                      bloc: widget.controller,
                      selector: (state) =>
                          state == ProjectRegisterStatus.loading,
                      onPressed: () async {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          final name = _nameEC.text;
                          final estimate = int.parse(_estimateEC.text);
                          await widget.controller.register(name, estimate);
                        }
                      },
                      label: 'Salvar',
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
