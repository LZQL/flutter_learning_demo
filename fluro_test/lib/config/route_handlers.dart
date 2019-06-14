/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro_test/page/splash_page.dart';
import 'package:fluro_test/page/home_page.dart';
import 'package:fluro_test/page/demo_params_pag.dart';
import 'package:fluro_test/utils/fluro_convert_util.dart';

var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new SplashPag();
});

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var demoParamHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String name = params["name"]?.first;
  String age = params["age"]?.first;
  String sex = params["sex"]?.first;
  String personjson = params['personjson']?.first;
  return DemoParamsPage(
    name: name,
    age: transformInt(age),
    sex: transformBool(sex),
    personJson: personjson,
  );
});

/// String  转为  bool
bool transformBool(String str) {
  if (str == 'true') {
    return true;
  } else {
    return false;
  }
}

/// String  转为  int
int transformInt(String str) {
  return int.parse(str);
}

//var rootHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  return new HomeComponent();
//});
//
//var demoRouteHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  String message = params["message"]?.first;
//  String colorHex = params["color_hex"]?.first;
//  String result = params["result"]?.first;
//  Color color = new Color(0xFFFFFFFF);
//  if (colorHex != null && colorHex.length > 0) {
//    color = new Color(ColorHelpers.fromHexString(colorHex));
//  }
//  return new DemoSimpleComponent(
//      message: message, color: color, result: result);
//});
//
//var demoFunctionHandler = new Handler(
//    type: HandlerType.function,
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String message = params["message"]?.first;
//      showDialog(
//        context: context,
//        builder: (context) {
//          return new AlertDialog(
//            title: new Text(
//              "Hey Hey!",
//              style: new TextStyle(
//                color: const Color(0xFF00D6F7),
//                fontFamily: "Lazer84",
//                fontSize: 22.0,
//              ),
//            ),
//            content: new Text("$message"),
//            actions: <Widget>[
//              new Padding(
//                padding: new EdgeInsets.only(bottom: 8.0, right: 8.0),
//                child: new FlatButton(
//                  onPressed: () {
//                    Navigator.of(context).pop(true);
//                  },
//                  child: new Text("OK"),
//                ),
//              ),
//            ],
//          );
//        },
//      );
//    });
//
///// Handles deep links into the app
///// To test on Android:
/////
///// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
//var deepLinkHandler = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//  String colorHex = params["color_hex"]?.first;
//  String result = params["result"]?.first;
//  Color color = new Color(0xFFFFFFFF);
//  if (colorHex != null && colorHex.length > 0) {
//    color = new Color(ColorHelpers.fromHexString(colorHex));
//  }
//  return new DemoSimpleComponent(
//      message: "DEEEEEP LINK!!!", color: color, result: result);
//});
