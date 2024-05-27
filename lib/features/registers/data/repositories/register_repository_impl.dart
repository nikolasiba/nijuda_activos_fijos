import 'package:activosfijos/features/registers/data/datasources/register_firebase.dart';
import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';
import 'package:activosfijos/features/registers/domain/entiites/branch.dart';
import 'package:activosfijos/features/registers/domain/repositories/register_repositry.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final firebaseDataSource = RegisterFirebaseDataSource();
  @override
  Future<List<BranchModel>> getBranches() {
    return firebaseDataSource.getBranches();
  }

  @override
  Future<String> saveImage(file, String uid) {
    return firebaseDataSource.saveImage(file, uid);
  }

  @override
  Future saveRegister(ActiveModel activeModel) {
    return firebaseDataSource.saveRegister(activeModel);
  }
}
