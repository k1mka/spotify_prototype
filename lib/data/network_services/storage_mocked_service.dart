import 'package:spotify_prototype/data/models/track_model.dart';

abstract class StorageMockedService {
  Future<List<TrackModel>> fetchModel();
}
