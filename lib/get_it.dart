import 'package:get_it/get_it.dart';
import 'package:spotify_prototype/data/network_services/mocked_network_service.dart';
import 'package:spotify_prototype/data/network_services/network_service.dart';
import 'package:spotify_prototype/data/storage_services/track_storage_service_impl.dart';
import 'package:spotify_prototype/data/storage_services/track_storage_servise.dart';
import 'package:spotify_prototype/data/repository/repo_impl.dart';
import 'package:spotify_prototype/data/repository/repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dataService = MockedServiceImpl();
  final trackStorage = TrackStorageServiceImpl();
  getIt.registerSingleton<NetworkService>(dataService);
  getIt.registerSingleton<TrackStorageService>(trackStorage);

  getIt.registerSingleton<Repository>(
    RepoImpl(
      networkService: dataService,
      trackStorageService: trackStorage,
    ),
  );
}
