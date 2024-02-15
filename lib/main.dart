import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:neo_cafe_24/core/app/aplication.dart';
import 'package:neo_cafe_24/core/dependensies/di.dart';
import 'package:neo_cafe_24/core/dependensies/hive.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen.dart/data/model/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetup.initHive();

  final cartBox = await Hive.openBox<CartModel>('cartBox');
  getIt.registerSingleton<Box<CartModel>>(cartBox);
  setupDependensies();
  runApp(
    const MyApp(),
  );
}
