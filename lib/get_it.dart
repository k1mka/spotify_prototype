import 'package:get_it/get_it.dart';
import 'package:spotify_prototype/data/network_services/mocked_network_service.dart';

import 'data/network_services/network_service.dart';
import 'data/repository/repo_impl.dart';
import 'data/repository/repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dataService = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(dataService);
  getIt.registerSingleton<Repository>(
    RepoImpl(dataService),
  );
}
