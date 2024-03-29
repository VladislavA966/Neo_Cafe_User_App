import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/model/new_order_model/new_order_model.dart';

abstract class NewOrderRemote {
  Future<void> sendNewOrder(NewOrderModel order);
}

class NewOrderRemoteImpl implements NewOrderRemote {
  final Dio dio;

  NewOrderRemoteImpl({required this.dio});
  @override
  Future<void> sendNewOrder(NewOrderModel order) async {
    final jsonData = order.toJson();
    await dio.post(
      '/orders-online/add/',
      data: jsonEncode(
        jsonData,
      ),
      options: Options(
        extra: {"requiresToken": true},
      ),
    );
  }
}
