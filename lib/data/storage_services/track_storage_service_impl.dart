import 'package:hive_flutter/hive_flutter.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/storage_services/track_storage_servise.dart';

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
