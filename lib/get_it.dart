import 'package:get_it/get_it.dart';
import 'package:spotify_prototype/data/network_services/mocked_network_service.dart';
import 'package:spotify_prototype/data/network_services/network_service.dart';
import 'package:spotify_prototype/data/network_services/storage_mocked_impl.dart';
import 'package:spotify_prototype/data/network_services/storage_mocked_service.dart';

import 'package:spotify_prototype/data/network_services/track_storage_servise.dart';
import 'package:spotify_prototype/data/repository/repo_impl.dart';
import 'package:spotify_prototype/data/repository/repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dataService = MockedServiceImpl();
  final dataStorageService = StorageMockedImpl();
  final trackStorage = TrackStorageServiceImpl();
  getIt.registerSingleton<NetworkService>(dataService);
  getIt.registerSingleton<StorageMockedService>(dataStorageService);
  getIt.registerSingleton<TrackStorageService>(trackStorage);

  getIt.registerSingleton<Repository>(
    RepoImpl(
      storageMockedService: dataStorageService,
      networkService: dataService,
      trackStorageService: trackStorage,
    ),
  );
}
