import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class StoreRawg {
    final int id;
    final GenreRawg store;

    StoreRawg({
        required this.id,
        required this.store,
    });

    factory StoreRawg.fromJson(Map<String, dynamic> json) => StoreRawg(
        id: json["id"] ?? 0,
        store: GenreRawg.fromJson(json["store"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "store": store.toJson(),
    };
}

