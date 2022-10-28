import 'package:get_it/get_it.dart';
import 'package:spotify_prototype/data/network_services/mocked_network_service.dart';
import 'package:spotify_prototype/data/network_services/network_service.dart';
import 'package:spotify_prototype/data/network_services/network_service_impl.dart';
import 'package:spotify_prototype/data/network_services/storage_mocked_impl.dart';
import 'package:spotify_prototype/data/network_services/storage_mocked_service.dart';
import 'data/repository/repo_impl.dart';
import 'data/repository/repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dataService = MockedServiceImpl();
  final dataStorageService = StorageMockedImpl();
  getIt.registerSingleton<NetworkService>(dataService);
  getIt.registerSingleton<StorageMockedService>(dataStorageService);
  getIt.registerSingleton<Repository>(
    RepoImpl(storageMockedService: dataStorageService, networkService: dataService),
  );
}
