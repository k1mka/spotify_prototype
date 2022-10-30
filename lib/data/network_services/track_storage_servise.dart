import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_prototype/data/models/track_model.dart';

abstract class TrackStorageService {
  Future<void> saveTrack(TrackModel trackModel);

  Future<List<TrackModel>> getSavedTracks();
}

class TrackStorageServiceImpl extends TrackStorageService {
  TrackStorageServiceImpl() {
    Hive.registerAdapter(TrackModelAdapter());
  }

  static const _catBoxKey = 'trackBox';
  static const _catFactKey = 'myTracks';

  @override
  Future<List<TrackModel>> getSavedTracks() async {
    final box = await Hive.openBox(_catBoxKey);
    final tracks = List<TrackModel>.from(box.get(_catFactKey));
    return tracks;
  }

  @override
  Future<void> saveTrack(TrackModel trackModel) async {
    final box = await Hive.openBox(_catBoxKey);
    final list = box.get(_catFactKey) ?? [];
    list.add(trackModel);
    await box.put(_catFactKey, list);
  }
}
