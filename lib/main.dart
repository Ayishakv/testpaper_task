import 'package:flutter/material.dart';

import 'package:testpaper_task/view/registration_screen/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Registration_screen(),
    );
  }
}
