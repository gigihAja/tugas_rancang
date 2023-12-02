import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateProvider(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
