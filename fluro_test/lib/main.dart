import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro_test/config/routes.dart';
import 'package:fluro_test/config/application.dart';
import 'package:fluro_test/my_app.dart';

//void main() => runApp(MyApp());

void main() {
  // 注册 fluro routes
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;


  runApp(MyApp());
}
