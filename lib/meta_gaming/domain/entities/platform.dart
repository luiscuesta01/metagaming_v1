import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class Platform {
    final int id;
    final String name;
    final String slug;

    Platform({
        required this.id,
        required this.name,
        required this.slug,
    });
 
  factory Platform.fromEsrbRatingRawg(EsrbRatingRawg esrbRatingRawg) => Platform(
    id: esrbRatingRawg.id, 
    name: esrbRatingRawg.name, 
    slug: esrbRatingRawg.slug);
}