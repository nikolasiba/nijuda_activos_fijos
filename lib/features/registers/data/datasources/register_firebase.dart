import 'package:activosfijos/features/registers/domain/entiites/active_model.dart';
import 'package:activosfijos/features/registers/domain/entiites/branch.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RegisterFirebaseDataSource {
  Future<List<BranchModel>> getBranches() async {
    List<BranchModel> branches = [];
    final db = await FirebaseDatabase.instance.ref().child('sedes').once();

    final datas = db.snapshot.value as Map?;

    if (datas != null && datas.isNotEmpty) {
      datas.forEach((key, value) {
        branches.add(BranchModel.fromJson(value as Map));
      });
    }

    return branches;
  }

  Future<String> saveImage(file, String uid) async {
    final storage = FirebaseStorage.instance.ref();
    final uploadTask = storage.child('images/$uid/$uid').putFile(file);
    final downloadUrl = await (await uploadTask).ref.getDownloadURL();
    return downloadUrl;
  }

  Future saveRegister(ActiveModel activeModel) async {
    try {
      final db = FirebaseDatabase.instance.ref().child('activos');
      await db.push().set(activeModel.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
