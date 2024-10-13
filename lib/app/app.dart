import 'package:Newtr_application/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal();
  int appState = 0 ; 

  static final MyApp _instance  = MyApp._internal();
  factory MyApp() => _instance ; 

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: getAppLicationTheme(),);
  }
}