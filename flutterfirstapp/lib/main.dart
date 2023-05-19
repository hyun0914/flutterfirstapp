import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  Future.delayed(const Duration(milliseconds: 140));
  runApp(
    const MaterialApp(
      home: MainPage(),
    ),
  );
}
