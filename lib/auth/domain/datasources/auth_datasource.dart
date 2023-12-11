import '../entities/user.dart';

abstract class AuthDataSource {
  Future<UserMetaGaming> signInWithEmailPassword(String email, String password);
  Future<UserMetaGaming> registerWithEmailPassword(
      String email, String password, String fullName);
  // Future<UserMetaGaming> checkAuthStatus( String token );
  Future<void> signOut();
}
