class RequirementsRawg {
    final String minimum;
    final String? recommended;

    RequirementsRawg({
        required this.minimum,
        this.recommended,
    });

    factory RequirementsRawg.fromJson(Map<String, dynamic> json) => RequirementsRawg(
        minimum: json["minimum"],
        recommended: json["recommended"],
    );

    Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
    };
}