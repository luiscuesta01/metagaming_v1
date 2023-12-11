import 'package:metagaming/auth/domain/domain.dart';
import 'package:metagaming/auth/infrastructure/datasources/firebase_auth_datasource.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();

  

  @override
  Future<UserMetaGaming> signInWithEmailPassword(
      String email, String password) {
    return dataSource.signInWithEmailPassword(email, password);
  }

  @override
  Future<UserMetaGaming> registerWithEmailPassword(
      String email, String password, String fullName) {
    return dataSource.registerWithEmailPassword(email, password, fullName);
  }

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }
}
