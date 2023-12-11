import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/infrastructure/datasources/rawgapi_datasource.dart';
import 'package:metagaming/meta_gaming/infrastructure/repositories/game_repository_impl.dart';

// Este repositorio es inmutable, solo lectura.

final gameRepositoryProvider = Provider((ref) {
  return GameRepositoryImpl(RawgApiDatasource());
});
