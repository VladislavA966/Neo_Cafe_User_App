import 'package:neo_cafe_24/features/profile/domain/entity/order_entity.dart';

class ProfileEntity {
  final int customerId;
  final String firstName;
  final String email;
  final int bonusPoints;

  ProfileEntity({
    required this.customerId,
    required this.firstName,
    required this.bonusPoints,
    required this.email,
  });
}
