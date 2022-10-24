import "package:flutter/material.dart";
import 'package:zoom_lite/widgets/custom_button.dart';

import '../resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 180),
            const Text(
              "Start or Join a Meeting",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Image.asset("assets/images/login_page_img.jpeg"),
            ),
            
            CustomButton(text: "Login", onPressed: () async {
              bool result = await _authMethods.signInWithGoogle(context);
              if(result == true){
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, "/home");
              }
            }),
          ]
        ),
      ),
    );
  }
}