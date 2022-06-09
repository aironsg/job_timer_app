
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/register/project_register_module.dart';
import 'package:job_timer/app/modules/project/register/project_register_page.dart';

class ProjectModule extends Module{

@override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ModuleRoute('/register', module: ProjectRegisterModule()),
  ];
  
  
}