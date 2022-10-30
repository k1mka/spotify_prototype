import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/network_services/network_service.dart';
import 'package:spotify_prototype/data/storage_services/track_storage_servise.dart';
import 'package:spotify_prototype/data/repository/repository.dart';

class RepoImpl extends Repository {
  RepoImpl({required this.networkService, required this.trackStorageService});

  final NetworkService networkService;
  final TrackStorageService trackStorageService;

  @override
  Future<List<TrackModel>> fetchTrack({
    required String search,
    required int limit,
  }) =>
      networkService.fetchModel(search: search, limit: limit);

  @override
  Future<List<TrackModel>> getSavedTracks() => trackStorageService.getSavedTracks();

  @override
  Future<void> saveTrack(TrackModel trackModel) => trackStorageService.saveTrack(trackModel);
}
