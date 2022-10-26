import 'package:spotify_prototype/data/models/track_model.dart';

abstract class NetworkService {
  Future<List<TrackModel>> fetchModel({
    required String search,
    required int limit,
  });
}
