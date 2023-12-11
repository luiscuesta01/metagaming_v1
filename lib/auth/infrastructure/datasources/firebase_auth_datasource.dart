import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metagaming/auth/domain/domain.dart';
import 'package:metagaming/auth/infrastructure/infrastructure.dart';

import '../../domain/datasources/auth_datasource.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserMetaGaming> registerWithEmailPassword(
      String email, String password, String fullName) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // Actualizar el perfil del usuario
    await userCredential.user!.updateDisplayName(fullName);

    // Guardar el ID del usuario en Firestore
    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'fullName': fullName,
      'email': email,
    });

    UserMapper userMapper = UserMapper();
    return await userMapper.mapUserCredentialToUser(userCredential);
  }

  @override
  Future<UserMetaGaming> signInWithEmailPassword(
      String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    UserMapper userMapper = UserMapper();
    return await userMapper.mapUserCredentialToUser(userCredential);
  }

  // Método para cerrar sesión
  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
