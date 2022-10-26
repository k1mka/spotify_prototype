class TrackModel {
  TrackModel({
    required this.artistNames,
    required this.songName,
  });

  final String songName;
  final List<String> artistNames;

  String get artistsNamesFormatted => artistNames.join(', ');

  @override
  String toString() => 'TrackModel{songName: $songName, artistName: $artistNames}';
}
