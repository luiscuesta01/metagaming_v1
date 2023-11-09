class AddedByStatusRawg {
    final int yet;
    final int owned;
    final int beaten;
    final int toplay;
    final int dropped;
    final int playing;

    AddedByStatusRawg({
        required this.yet,
        required this.owned,
        required this.beaten,
        required this.toplay,
        required this.dropped,
        required this.playing,
    });

    factory AddedByStatusRawg.fromJson(Map<String, dynamic> json) => AddedByStatusRawg(
        yet: json["yet"],
        owned: json["owned"],
        beaten: json["beaten"],
        toplay: json["toplay"],
        dropped: json["dropped"],
        playing: json["playing"],
    );

    Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "beaten": beaten,
        "toplay": toplay,
        "dropped": dropped,
        "playing": playing,
    };
}