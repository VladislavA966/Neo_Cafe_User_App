import 'package:shared_preferences/shared_preferences.dart';

class BranchLocalData {
  Future<void> saveBranchId(int id) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('branchId', id);
  }

  Future<int?> getBranchId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt('branchId');
  }

  Future<void> removeId() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('branchId');
  }
}
