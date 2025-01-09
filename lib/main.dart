import 'package:bloc_clean_coding/config/routes/routes.dart';
import 'package:bloc_clean_coding/config/routes/routes_name.dart';
import 'package:bloc_clean_coding/repository/auth/login_http_api_repo.dart';
import 'package:bloc_clean_coding/repository/auth/login_repo.dart';
import 'package:flutter/material.dart';
import "package:get_it/get_it.dart";

GetIt getIt=GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }



}
void serviceLocator(){
  getIt.registerLazySingleton<LoginRepo>(()=>LoginHttpApiRepo());
}


