import 'package:hive_flutter/hive_flutter.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/storage_services/track_storage_service.dart';

class TrackStorageServiceImpl extends TrackStorageService {
  TrackStorageServiceImpl() {
    Hive.registerAdapter(TrackModelAdapter());
  }

  static const _trackBoxKey = 'trackBox';
  static const _favoriteTracksKey = 'favoriteTracks';

  @override
  Future<List<TrackModel>> getSavedTracks() async {
    final box = await Hive.openBox<List?>(_trackBoxKey);
    final data = box.get(_favoriteTracksKey) ?? [];
    final tracks = List<TrackModel>.from(data);
    return tracks;
  }

  @override
  Future<void> saveTrack(TrackModel trackModel) async {
    final box = await Hive.openBox<List?>(_trackBoxKey);
    final list = box.get(_favoriteTracksKey) ?? [];
    list.add(trackModel);
    await box.put(_favoriteTracksKey, list);
  }

  @override
  Future<void> deleteTrack(TrackModel trackModel) async {
    final box = await Hive.openBox<List?>(_trackBoxKey);
    final list = box.get(_favoriteTracksKey) ?? [];
    list.remove(trackModel);
    await box.put(_favoriteTracksKey, list);
  }
}
