


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/features/home/domain/model/movie_state.dart';
import 'package:movie_app/features/home/domain/service/movie_service.dart';

class MovieProvider extends StateNotifier<MovieState>{
  MovieProvider(super.state){
    
  }
  
  Future<void> getMovieData() async{
    if(state.isLoadMore){
      state = state.copyWith(movieState: state, isLoad: false);
      final data = await MovieService.getMovieByCategory(apiPath: state.apiPath, page: state.page);
      data.fold((l) {
        state = state.copyWith(movieState: state, errText: l, isLoad: false);
      },  (r) {
        state = state.copyWith(movieState: state, isLoad: false,movies: [...state.movies, ...r],errText: '');
      });
    }else{
      state = state.copyWith(movieState: state, isLoad: true);
      final data = await MovieService.getMovieByCategory(apiPath: state.apiPath, page: state.page);
      data.fold((l) {
        state = state.copyWith(movieState: state, errText: l, isLoad: false);
      },  (r) {
        state = state.copyWith(movieState: state, isLoad: false,movies: r,errText: '');
      });
    }
  }

  void changeCategory({required String apiPath}) {
    state = state.copyWith(movieState: state, apiPath: apiPath, movies: [], isLoadMore: false, page: 1);
    getMovieData();
  }
  
  
}