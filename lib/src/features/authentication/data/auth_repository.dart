import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository();
  bool _authenticated = false;
  bool get authenticated => _authenticated;
  set authenticated(bool authenticated) {
    _authenticated = authenticated;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository();
}
