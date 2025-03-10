import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) async {
    var user = await AuthService().signInWithEmail(
      emailController.text,
      passwordController.text,
    );

    if (user != null) {
      // ✅ Check if user is not null
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Failed. Try again.")));
    }
  }

  void _guestLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Traffic Alert App",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => _guestLogin(context),
              child: Text("Continue as Guest"),
            ),
          ],
        ),
      ),
    );
  }
}
