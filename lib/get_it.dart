import 'package:get_it/get_it.dart';
import 'package:spotify_prototype/data/network%20service/network_service.dart';

import 'data/repository/repo_impl.dart';
import 'data/repository/repository.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dataService = ServiceImpl();
  getIt.registerSingleton<NetworkService>(dataService);
  getIt.registerSingleton<Repository>(
    RepoImpl(dataService),
  );
}
