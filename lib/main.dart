import 'package:flutter/material.dart';
import 'package:zoom_lite/resources/auth_methods.dart';
import 'package:zoom_lite/screens/login_screen.dart';
import 'package:zoom_lite/screens/video_call_screen.dart';
import 'package:zoom_lite/utils/colors.dart';
import "package:firebase_core/firebase_core.dart";

import 'screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Lite',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes:{
        "/login" : (context) => const LoginScreen(),
        "/home" : (context) => const HomeScreen(),
        "/videocall":(context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            return const HomeScreen();
          }
          return const LoginScreen();
        }
      )
    );
  }
}

