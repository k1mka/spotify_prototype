import 'package:spotify_prototype/data/models/track_model.dart';

abstract class TrackStorageService {
  Future<void> saveTrack(TrackModel trackModel);

  Future<List<TrackModel>> getSavedTracks();
}
