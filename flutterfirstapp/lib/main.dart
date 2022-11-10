import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  Future.delayed(Duration(milliseconds: 150));
  runApp(
    MaterialApp(
      home: MainPage(),
    ),
  );
}
