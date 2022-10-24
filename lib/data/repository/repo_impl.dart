import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/network_services/mocked_network_service.dart';

import 'package:spotify_prototype/data/repository/repository.dart';

class RepoImpl extends Repository {
  RepoImpl(this.networkService);

  final NetworkService networkService;

  @override
  Future<List<TrackModel>> fetchTrack({
    required String search,
    required int limit,
  }) =>
      networkService.fetchModel(search: search, limit: limit);
}
