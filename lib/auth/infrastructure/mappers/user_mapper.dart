import 'package:firebase_auth/firebase_auth.dart';
import 'package:metagaming/auth/domain/entities/user.dart';

class UserMapper {
  Future<UserMetaGaming> mapUserCredentialToUser(
      UserCredential userCredential) async {
    String? token = await userCredential.user!.getIdToken();
    UserMetaGaming user = UserMetaGaming(
      id: userCredential.user!.uid,
      email: userCredential.user!.email!,
      fullName: userCredential.user!.displayName ?? '',
      token: token ?? '',
    );
    return user;
  }
}
