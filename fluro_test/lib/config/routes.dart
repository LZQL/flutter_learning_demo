import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro_test/config/route_handlers.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String demoParams = "/deme_params";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: splashHandler);
    router.define(home, handler: homeHandler);
    router.define(demoParams, handler: demoParamHandler);

//    router.define(root, handler: rootHandler);
//    router.define(demoSimple, handler: demoRouteHandler);
//    router.define(demoSimpleFixedTrans,
//        handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
//    router.define(demoFunc, handler: demoFunctionHandler);
//    router.define(deepLink, handler: deepLinkHandler);
  }
}
