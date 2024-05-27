import 'package:activosfijos/features/informs/data/datasources/informs_firebase.dart';
import 'package:activosfijos/features/informs/domain/repositories/informs_repository.dart';
import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';

class InformsRepositoryImpl implements InformsRepository {
  final datasource = InformsFirebase();
  @override
  Future<List<ActiveModel>> getInforms() async {
    return await datasource.getInforms();
  }
}
