import 'package:evently_c15/ui/screens/add_event/add_event.dart';
import 'package:evently_c15/ui/screens/home/home.dart';
import 'package:evently_c15/ui/screens/login/login.dart';
import 'package:evently_c15/ui/screens/register/register.dart';
import 'package:evently_c15/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static Route get login => MaterialPageRoute(builder: (_) => Login());

  static Route get home => MaterialPageRoute(builder: (_) => Home());

  static Route get addEvent => MaterialPageRoute(builder: (_) => AddEvent());

  static Route get splash => MaterialPageRoute(builder: (_) => Splash());

  static Route get register => MaterialPageRoute(builder: (_) => Register());
}
