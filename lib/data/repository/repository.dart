import 'package:spotify_prototype/data/models/track_model.dart';

abstract class Repository {
  Future<List<TrackModel>> fetchTrack({
    required String search,
    required int limit,
  });

  Future<void> saveTrack(TrackModel trackModel);

  Future<List<TrackModel>> getSavedTracks();
}
