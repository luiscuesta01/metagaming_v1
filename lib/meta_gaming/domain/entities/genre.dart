import 'package:metagaming/meta_gaming/infrastructure/models/rawg/models.dart';

class Genre {
    final int id;
    final String name;
    final String slug;
    final int gamesCount;
    final String imageBackground;
    //final String domain;
    //final String language;

    Genre({
        required this.id,
        required this.name,
        required this.slug,
        required this.gamesCount,
        required this.imageBackground,
        //required this.domain,
        //required this.language,
    });
    
    factory Genre.fromGenreRawg(GenreRawg genreRawg) => Genre(
      id: genreRawg.id, 
      name: genreRawg.name, 
      slug: genreRawg.slug, 
      gamesCount: genreRawg.gamesCount, 
      imageBackground: genreRawg.imageBackground);
      //domain: genreRawg.domain, 
      //language: genreRawg.language
}