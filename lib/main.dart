import 'package:filmku/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmku',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(body: Center(child: Text('Hello World'))),
    );
  }
}
