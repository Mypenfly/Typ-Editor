import 'package:editor_app/pages/main/index.dart';
import 'package:flutter/material.dart';

///app路由
Widget appRoutes () {
  return MaterialApp(
    initialRoute: "/",
    routes: _getRoutes(),
  );
  
}

Map<String,Widget Function(BuildContext)> _getRoutes () {
  return {
    "/":(context) => MainPage(),
    "/settings":(context) => Text("设置页")
  };
}

