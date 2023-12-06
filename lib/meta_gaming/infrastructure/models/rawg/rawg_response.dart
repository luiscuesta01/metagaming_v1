

import 'package:metagaming/meta_gaming/infrastructure/models/rawg/game_rawg.dart';

class RawgResponse {
    final int count;
    final String next;
    final dynamic previous;
    final List<GameRawg> results;
    final String seoTitle;
    final String seoDescription;
    final String seoKeywords;
    final String seoH1;
    final bool noindex;
    final bool nofollow;
    final String description;
    final Filters filters;
    final List<String> nofollowCollections;

    RawgResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
        required this.seoTitle,
        required this.seoDescription,
        required this.seoKeywords,
        required this.seoH1,
        required this.noindex,
        required this.nofollow,
        required this.description,
        required this.filters,
        required this.nofollowCollections,
    });

    factory RawgResponse.fromJson(Map<String, dynamic> json) => RawgResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<GameRawg>.from(json["results"].map((x) => GameRawg.fromJson(x))),
        seoTitle: json["seo_title"] ?? '',
        seoDescription: json["seo_description"]?? '',
        seoKeywords: json["seo_keywords"]?? '',
        seoH1: json["seo_h1"]?? '',
        noindex: json["noindex"] ?? false,
        nofollow: json["nofollow"] ?? false,
        description: json["description"] ?? '',
        filters: Filters.fromJson(json["filters"]??{'filter1': 'default'}),
        nofollowCollections: List<String>.from(json["nofollow_collections"]?.map((x) => x) ?? []),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "seo_keywords": seoKeywords,
        "seo_h1": seoH1,
        "noindex": noindex,
        "nofollow": nofollow,
        "description": description,
        "filters": filters.toJson(),
        "nofollow_collections": List<dynamic>.from(nofollowCollections.map((x) => x)),
    };
}

class Filters {
    final List<FiltersYear> years;

    Filters({
        required this.years,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
 years: List<FiltersYear>.from(json["years"]?.map((x) => FiltersYear.fromJson(x)) ?? []),
);

    Map<String, dynamic> toJson() => {
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
    };
}

class FiltersYear {
    final int from;
    final int to;
    final String filter;
    final int decade;
    final List<YearYear> years;
    final bool nofollow;
    final int count;

    FiltersYear({
        required this.from,
        required this.to,
        required this.filter,
        required this.decade,
        required this.years,
        required this.nofollow,
        required this.count,
    });

    factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"],
        to: json["to"],
        filter: json["filter"],
        decade: json["decade"],
        years: List<YearYear>.from(json["years"].map((x) => YearYear.fromJson(x))),
        nofollow: json["nofollow"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "filter": filter,
        "decade": decade,
        "years": List<dynamic>.from(years.map((x) => x.toJson())),
        "nofollow": nofollow,
        "count": count,
    };
}

class YearYear {
    final int year;
    final int count;
    final bool nofollow;

    YearYear({
        required this.year,
        required this.count,
        required this.nofollow,
    });

    factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"],
        count: json["count"],
        nofollow: json["nofollow"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
    };
}

