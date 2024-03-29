import 'package:neo_cafe_24/core/use_case/use_case.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/repository_impl/new_order_repo_impl.dart';

class NewOrderUseCase extends UseCase<void, int> {
  final NewOrderRepoImpl repo;

  NewOrderUseCase({required this.repo});
  @override
  Future<void> call(int params) async {
    await repo.sendNewOrder(params);
  }
}
