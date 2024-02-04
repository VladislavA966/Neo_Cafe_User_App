import 'package:flutter/material.dart';
import 'package:neo_cafe_24/core/app/aplication.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';

void main() {
  setupDependensies();
  runApp(
    const MyApp(),
  );
}
