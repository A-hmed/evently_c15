import 'package:evently_c15/ui/screens/login/login.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static Route get login => MaterialPageRoute(builder: (_) => Login());
}

