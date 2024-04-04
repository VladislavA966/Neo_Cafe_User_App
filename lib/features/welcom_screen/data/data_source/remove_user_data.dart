import 'package:neo_cafe_24/features/auth/auth_by_email/data/data_source/local_data_source/local_data_source.dart';
import 'package:neo_cafe_24/features/branches/data/data_source/local/branch_local_data.dart';
import 'package:neo_cafe_24/features/shopping_cart_screen/data/data_source/local/cart_local_data_source.dart';

abstract class RemoveUserData {
  Future<void> remoteUserData();
}

class RemoveUserDataImpl implements RemoveUserData {
  final BranchLocalData branchLocalData;
  final LocalDataSource authLocalData;
  final CartLocalDataSource cartLocalData;

  RemoveUserDataImpl(
      {required this.branchLocalData,
      required this.authLocalData,
      required this.cartLocalData});
  @override
  Future<void> remoteUserData() async {
    await branchLocalData.removeId();
    await authLocalData.deleteAllTokens();
    await cartLocalData.clearCart();
  }
}
