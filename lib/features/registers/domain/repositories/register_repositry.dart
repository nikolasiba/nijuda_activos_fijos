import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';
import 'package:activosfijos/features/registers/domain/entiites/branch.dart';

abstract class RegisterRepository {
  Future<List<BranchModel>> getBranches();
  Future<String> saveImage(dynamic file, String uid);
  Future<dynamic> saveRegister(ActiveModel activeModel);
}
