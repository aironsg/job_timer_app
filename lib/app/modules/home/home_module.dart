
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import 'home_page.dart';

class HomeModule extends Module{

  @override
  // TODO: implement binds
  List<Bind> get binds => [
    BlocBind.lazySingleton((i) => HomeController(service: i())) // AppModule
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: ((context, args) => HomePage(controller : Modular.get()..loadProjects()))),
    
  ];
}