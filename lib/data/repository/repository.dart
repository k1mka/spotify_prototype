import 'package:spotify_prototype/data/models/track_model.dart';

abstract class Repository {
  Future<List<TrackModel>> fetchTrack();
}
