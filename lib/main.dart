import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(FoodEmojiApp());
}

class FoodEmojiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Emoji UI',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/about': (context) => AboutScreen(),
        '/contact': (context) => ContactScreen(),
      },
    );
  }
}
