import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reposicion_examen_peliculas/fetchData/movieModel.dart';
import 'package:reposicion_examen_peliculas/fetchData/movieState.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieWaiting()) {
    fetchMovies();
  }

  void fetchMovies() async {
  final dio = Dio();
  final response = await dio.get(
      'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3');
  if (response.statusCode == 200 && response.data != null) {
    List<Movie> movies = List<Movie>.from(response.data['results'].map((x) => Movie.fromJson(x)));
    emit(MovieLoaded(movies: movies));
  } else {
    emit(MovieFailed(message: "No se cargaron las pelis"));
  }
}

}

