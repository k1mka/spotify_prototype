class TrackModel {
  TrackModel({
    required this.artistName,
    required this.songName,
    required this.trackImage,
  });

  final String songName;
  final String artistName;
  final String trackImage;

  @override
  String toString() => 'TrackModel{songName: $songName, artistName: $artistName, trackImage: $trackImage}';
}
