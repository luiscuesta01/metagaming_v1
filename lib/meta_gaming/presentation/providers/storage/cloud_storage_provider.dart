import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metagaming/meta_gaming/infrastructure/datasources/firebase_datasource.dart';
import 'package:metagaming/meta_gaming/infrastructure/repositories/cloud_storage_repository_impl.dart';

final cloudStorageRepositoryProvider = Provider((ref) {
  return CloudStorageRepositoryImpl(FirebaseDatasource());
});
