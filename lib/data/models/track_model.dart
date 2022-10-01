class TrackModel {
  TrackModel(
      {required this.artistName,
      required this.songName,
      required this.trackImage});

  String songName;
  String artistName;
  String trackImage;

  @override
  String toString() =>
      '{songName: $songName, artistName: $artistName, trackImage: $trackImage, songName: $songName}';
}
