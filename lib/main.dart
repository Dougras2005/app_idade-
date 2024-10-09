import 'package:app_idade/pages/idade_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const IdadeApp());
}

class IdadeApp extends StatelessWidget {
  const IdadeApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'De acordo com sua idade você é...',
      home: IdadePage(),
    );
  }
}
