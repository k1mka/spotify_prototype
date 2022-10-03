import 'package:spotify_prototype/data/models/track_model.dart';

abstract class NetworkService {
  Future<List<TrackModel>> fetchModel();
}

class MockedServiceImpl extends NetworkService {
  final artistName = 'Kiss';
  final songName = 'I was made for loving you baby';
  final trackImage = 'https://cdns-images.dzcdn.net/images/artist/d841e3ff7379c9272005e53f1c46f5b9/500x500.jpg';

  static const numberOfMockedData = 10;

  @override
  Future<List<TrackModel>> fetchModel() async => [
        for (var i = 0; i < numberOfMockedData; i++)
          TrackModel(
            trackImage: trackImage,
            artistName: songName,
            songName: artistName,
          ),
      ];
}
