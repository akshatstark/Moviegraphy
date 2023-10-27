import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'dart:async';

import 'package:moviegraphy/model/movie.dart';
import '../model/main_page_data.dart';
import '../model/movie.dart';

import '../service/movie_services.dart';

class MainPageDataController extends StateNotifier<MainPageData> {
  MainPageDataController([MainPageData? state])
      : super(state ?? MainPageData.initial()) {
    // here
    getMovies();
  }

  final MovieService _movieService = GetIt.instance.get<MovieService>();

  Future<void> getMovies() async {
    try {
      {
        List<Movie>? movies=[];
        movies = await (_movieService.getPopularMovies(page: state.page));
      }
    }
    catch (e) {}
  }
}
