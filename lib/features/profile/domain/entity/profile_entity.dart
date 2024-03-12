import 'package:neo_cafe_24/features/profile/domain/entity/order_entity.dart';

class ProfileEntity {
  final int customerId;
  final String firstName;
  final int bonusPoints;
  final String email;
  final List<OrdersEntity> orders;

  ProfileEntity({
    required this.customerId,
    required this.firstName,
    required this.bonusPoints,
    required this.email,
    required this.orders,
  });
}




