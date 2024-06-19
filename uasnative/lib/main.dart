import 'package:flutter/material.dart';
import 'package:uasnative/home_screen.dart';
import 'package:uasnative/register_screen.dart';
import 'package:uasnative/login_screen.dart';
import 'package:uasnative/content_screen.dart';
import 'package:uasnative/profile_screen.dart';
import 'package:uasnative/stateful_widget.dart';
import 'package:uasnative/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/content': (context) => ContentScreen(),
        '/profile': (context) => ProfileScreen(username: '', email: ''),
        '/stateful': (context) => MyStatefulWidget(),
        '/bottom_navigation': (context) => MyBottomNavigationBar(),
      },
    );
  }
}
