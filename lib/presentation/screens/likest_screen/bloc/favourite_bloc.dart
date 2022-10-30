import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_events.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_states.dsrt.dart';

class FavoriteBloc extends Bloc<LikeTrackEvent, FavouriteStates> {
  Repository repo;
  FavoriteBloc(this.repo) : super(InitialState()) {
    on<LikeTrackEvent>((event, emit) async {
      emit(LoadingFavorite());
      try {
        final tracks = await repo.getSavedTracks();
        emit(LoadedFavorite(tracks));
      } catch (e) {
        emit(ErrorFavorite(e));
      }
    });
  }
}
