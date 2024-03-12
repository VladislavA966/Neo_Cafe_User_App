import 'package:neo_cafe_24/core/mapper/mapper.dart';
import 'package:neo_cafe_24/features/profile/data/mapper/order_mapper.dart';
import 'package:neo_cafe_24/features/profile/data/models/profile_model/profile_model.dart';
import 'package:neo_cafe_24/features/profile/domain/entity/profile_entity.dart';

class ProfileMapper extends Mapper<ProfileModel, ProfileEntity> {
  final OrderMapper orderMapper;

  ProfileMapper({required this.orderMapper});
  @override
  ProfileEntity mapper(ProfileModel model) {
    return ProfileEntity(
      customerId: model.customerId ?? 0,
      firstName: model.firstName ?? '',
      bonusPoints: model.bonusPoints ?? 0,
      email: model.email ?? '',
      orders: model.orders?.map(orderMapper.mapper).toList() ?? [],
    );
  }
}
