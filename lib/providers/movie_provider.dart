
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/movie_state.dart';
import '../services/movie_service.dart';





class MovieProvider extends StateNotifier<MovieState>{
  MovieProvider(super._state){
   getMovieData();
  }

  Future<void> getMovieData() async {
    if(state.isLoadMore){
      state = state.copyWith(movieState: state, isLoad: false);
      final data = await MovieService.getMovieByCategory(apiPath: state.apiPath, page: state.page);
      data.fold((l) {
        state = state.copyWith(movieState: state, errText: l, isLoad: false);
      },  (r) {
        state = state.copyWith(movieState: state, isLoad: false,movies: [...state.movies, ...r],errText: '');
      });
    }
  }


}