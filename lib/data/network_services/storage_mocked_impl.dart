import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/network_services/storage_mocked_service.dart';

class StorageMockedImpl extends StorageMockedService {
  final artistName = 'Kiss';
  final songName = 'I was made for loving you baby';
  final trackImage = 'https://cdns-images.dzcdn.net/images/artist/d841e3ff7379c9272005e53f1c46f5b9/500x500.jpg';

  static const numberOfMockedData = 10;

  @override
  Future<List<TrackModel>> fetchModel() async => [
        for (var i = 0; i < numberOfMockedData; i++)
          TrackModel(
            songName: [songName],
            artistNames: [artistName],
          ),
      ];
}
