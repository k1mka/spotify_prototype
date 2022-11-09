import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/favorite_screen/bloc/favorite_events.dart';
import 'package:spotify_prototype/presentation/screens/favorite_screen/bloc/favorite_states.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final Repository repo;

  FavoriteBloc(this.repo) : super(InitialFavoriteState()) {
    // todo: implement deletion of track from favorite list
    on<LoadFavoriteEvent>(
      (event, emit) async {
        try {
          emit(LoadingFavoriteState());

          final track = await repo.getSavedTracks();
          emit(LoadedFavoriteState(track));
        } catch (e) {
          emit(ErrorFavoriteState(e));
        }
      },
    );
    on<DeleteFavoriteEvent>((event, emit) async {
      try {
        emit(LoadingFavoriteState());
        await repo.deleteTrack(event.model);
        final track = await repo.getSavedTracks();
        emit(LoadedFavoriteState(track));
      } catch (e) {
        emit(ErrorFavoriteState(e));
      }
    });
  }
}
