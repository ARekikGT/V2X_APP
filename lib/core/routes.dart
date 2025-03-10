import 'package:flutter/material.dart';
import '../views/home_screen.dart'; // Ensure this file contains the HomeScreen class
import '../views/auth_screen.dart';
import '../views/map_screen.dart';
import '../views/alerts_screen.dart';
import '../views/settings_screen.dart';

class AppRoutes {
  static const String home = '../views/home_screen.dart';
  static const String auth = '/auth';
  static const String map = '/map';
  static const String alerts = '/alerts';
  static const String settings = '/settings';

  static Map<String, WidgetBuilder> routes = {
    auth: (context) => AuthScreen(),
    home: (context) => HomeScreen(),
    map: (context) => MapScreen(),
    alerts: (context) => AlertsScreen(),
    settings: (context) => SettingsScreen(),
  };
}


