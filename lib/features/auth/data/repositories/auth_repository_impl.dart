import 'package:activosfijos/features/auth/data/datasource/remote/auth_firebase.dart';
import 'package:activosfijos/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebase authFirebase;

  AuthRepositoryImpl({required this.authFirebase});

  @override
  Future<bool> loginFirebase(
      {required String email, required String password}) {
    return authFirebase.loginFirebase(email: email, password: password);
  }
}
