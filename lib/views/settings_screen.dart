import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeService>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: SwitchListTile(
        title: Text("Dark Mode"),
        value: themeProvider.isDarkMode,
        onChanged: (val) => themeProvider.toggleTheme(),
      ),
    );
  }
}
