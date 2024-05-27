import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';

abstract class InformsRepository {
  Future<List<ActiveModel>> getInforms();
}
