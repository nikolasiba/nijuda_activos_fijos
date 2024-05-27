import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';
import 'package:firebase_database/firebase_database.dart';

class InformsFirebase {
  Future<List<ActiveModel>> getInforms() async {
    List<ActiveModel> actives = [];
    final db = await FirebaseDatabase.instance.ref().child('activos').once();

    final datas = db.snapshot.value as Map?;

    if (datas != null && datas.isNotEmpty) {
      datas.forEach((key, value) {
        actives.add(ActiveModel.fromJson(value as Map));
      });
    }

    return actives;
  }
}
