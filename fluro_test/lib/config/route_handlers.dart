/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro_test/page/return_params_page.dart';
import 'package:fluro_test/page/transition_demo_page.dart';
import 'package:flutter/painting.dart';
import 'package:fluro_test/utils/fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluro_test/page/splash_page.dart';
import 'package:fluro_test/page/home_page.dart';
import 'package:fluro_test/page/demo_params_pag.dart';
import 'package:fluro_test/utils/fluro_convert_util.dart';

var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new SplashPag();
});

/// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

/// 参数传递 int ，double，bool，自定义类型
var demoParamHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String name = params["name"]?.first;
  String age = params["age"]?.first;
  String sex = params["sex"]?.first;
  String score = params["score"]?.first;
  String personjson = params['personjson']?.first;
  return DemoParamsPage(
    name: name,
    age: FluroConvertUtils.string2int(age),
    score: FluroConvertUtils.string2double(score),
    sex: FluroConvertUtils.string2bool(sex),
    personJson: personjson,
  );
});

/// 关闭页面，返回参数
var returnParamHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  return ReturnParamsPage();
});

/// 转场动画 页面
var transitionDemoHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
  String title = params["title"]?.first;
  return TransitionDemoPage(title);
});
