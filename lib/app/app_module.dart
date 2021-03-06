import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/database/databaseImpl.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/modules/project/project_module.dart';
import 'package:job_timer/app/modules/splash/splash_page.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/repositories/projects/project_repositoryImpl.dart';
import 'package:job_timer/app/service/auth/auth_service.dart';
import 'package:job_timer/app/service/auth/auth_service_impl.dart';
import 'package:job_timer/app/service/projects/project_service.dart';
import 'package:job_timer/app/service/projects/project_service_impl.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<Database>((i) => DatabaseImpl()),
        Bind.lazySingleton<AuthService>((i) => AuthServiceImpl(database: i())),//AppModule
        Bind.lazySingleton<ProjectRepository>(
            (i) => ProjectRepositoryImpl(database: i())),
        Bind.lazySingleton<ProjectService>(
            (i) => ProjectServiceImpl(repository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const SplashPage())),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/project', module: ProjectModule()),
        
      ];
}
