import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metagaming/meta_gaming/domain/datasources/cloud_storage_datasource.dart';
import 'package:metagaming/meta_gaming/domain/entities/game.dart';

class FirebaseDatasource extends CloudStorageDatasource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<bool> isGameFavorite(int gameId) async {
    final snapshot = await _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('games')
        .doc(gameId.toString())
        .get();
    return snapshot.exists;
  }

  @override
  Future<List<Game>> loadGames({int limit = 10, offset = 0}) async {
    final snapshot = await _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('games')
        .get();
    final games =
        snapshot.docs.map((doc) => Game.fromJson(doc.data())).toList();
    return games.skip(offset).take(limit).toList();
  }

  @override
  Future<void> toggleFavorite(Game game) async {
    final snapshot = await _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('games')
        .doc(game.id.toString())
        .get();
    if (snapshot.exists) {
      await _db
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('games')
          .doc(game.id.toString())
          .delete();
    } else {
      await _db
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('games')
          .doc(game.id.toString())
          .set(game.toJson());
    }
  }

  Future<void> setGameStatus(Game game, String status) async {
    // Verifica si el juego ya existe en el estado actual
    final snapshot = await _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection(status)
        .doc(game.id.toString())
        .get();

    if (snapshot.exists) {
      // Si el juego ya existe en el estado actual, lo eliminamos
      await _db
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection(status)
          .doc(game.id.toString())
          .delete();
    }

    // Agrega el juego a su nuevo estado
    await _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection(status)
        .doc(game.id.toString())
        .set(game.toJson());
  }

  Future<List<Game>> loadGamesByStatus(String status,
      {int limit = 10, offset = 0}) async {
    final snapshot = await _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection(status)
        .get();
    final games =
        snapshot.docs.map((doc) => Game.fromJson(doc.data())).toList();
    return games.skip(offset).take(limit).toList();
  }
}
