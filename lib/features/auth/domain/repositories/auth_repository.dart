abstract class AuthRepository {
  Future<bool> loginFirebase({
    required String email,
    required String password,
  });
}
