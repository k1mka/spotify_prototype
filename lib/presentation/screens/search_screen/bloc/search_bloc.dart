import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_prototype/data/models/track_model.dart';
import 'package:spotify_prototype/data/repository/repository.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_events.dart';
import 'package:spotify_prototype/presentation/screens/search_screen/bloc/search_states.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  SearchBloc(this.repository) : super(InitialSearchState()) {
    on<SearchTrackEvent>((event, emit) async {
      try {
        emit(SearchingState());
        final List<TrackModel> tracks = await repository.fetchTrack(search: event.search, limit: event.limit);
        emit(LoadedSearchedTracksState(tracks));
      } catch (e) {
        emit(ErrorSearchState(e));
      }
    });
    on<LikeTrackEvent>((event, emit) async {
      try {
        await repository.saveTrack(event.trackModel);
      } catch (e) {
        emit(ErrorSearchState(e));
      }
    });
  }
}
