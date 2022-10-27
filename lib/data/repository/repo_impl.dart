import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/network_services/network_service.dart';
import 'package:spotify_prototype/data/network_services/storage_mocked_service.dart';
import 'package:spotify_prototype/data/repository/repository.dart';

class RepoImpl extends Repository {
  RepoImpl({required this.networkService, required this.storageMockedService});

  final NetworkService networkService;
  final StorageMockedService storageMockedService;

  @override
  Future<List<TrackModel>> fetchTrack({
    required String search,
    required int limit,
  }) =>
      networkService.fetchModel(search: search, limit: limit);

  @override
  Future<List<TrackModel>> fetchFavourite() => storageMockedService.fetchModel();
}
