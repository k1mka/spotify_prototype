import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_events.dart';
import 'package:spotify_prototype/presentation/screens/likest_screen/bloc/favorite_states.dsrt.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavouriteState> {
  Repository repo;
  FavoriteBloc(this.repo) : super(InitialFavoriteState()) {
    on<LikeTrackEvent>((event, emit) async {
      emit(LoadingFavoriteState());
      try {
        final tracks = await repo.getSavedTracks();
        emit(LoadedFavoriteState(tracks));
      } catch (e) {
        emit(ErrorFavoriteState(e));
      }
    });
  }
}
