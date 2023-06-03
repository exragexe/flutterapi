import 'package:flutter/material.dart';
import 'package:projectapi/screens/home.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
       return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Home(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      
    );
    
    
  }
}