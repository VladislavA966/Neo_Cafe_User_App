import 'package:dio/dio.dart';
import 'package:neo_cafe_24/features/order_history/data/models/order_model/order_model.dart';

abstract class OrderHistoryRemoteData {
  Future<List<OrdersModel>> getOrderHistory();
}

class OrderHistoryRemoteDataImpl implements OrderHistoryRemoteData {
  final Dio dio;

  OrderHistoryRemoteDataImpl({required this.dio});
  @override
  Future<List<OrdersModel>> getOrderHistory() async {
    final responce = await dio.get(
      '/customer/orders/',
      options: Options(
        extra: {"requiresToken": true},
      ),
    );

    if (responce.statusCode == 200 || responce.statusCode == 201) {
      List<dynamic> jsonData = responce.data;
      List<OrdersModel> orderModel =
          jsonData.map((json) => OrdersModel.fromJson(json)).toList();
      return orderModel;
    } else {
      throw Error();
    }
  }
}
