import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_events.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_states.dsrt.dart';

class FavoriteBloc extends Bloc<LoadedFavoriteList, FavouriteStates> {
  Repository repo;
  FavoriteBloc(this.repo) : super(InitialState()) {
    on<LoadedFavoriteList>((event, emit) async {
      emit(LoadingFavorite());
      try {
        emit(LoadedFavorite(await repo.fetchFavourite()));
      } catch (e) {
        emit(ErrorFavorite(e));
      }
    });
  }
}
