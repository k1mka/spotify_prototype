class TrackModel {
  TrackModel(
      {required this.artistName,
      required this.songName,
      required this.trackImage});

  String songName;
  String artistName;
  String trackImage;

  List<TrackModel> playList() {
    return [
      for (var i = 0; i > 10; i++)
        TrackModel(trackImage: '1234', songName: '1234', artistName: '123')
    ];
  }
}
