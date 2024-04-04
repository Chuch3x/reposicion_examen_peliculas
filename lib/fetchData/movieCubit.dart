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
    final response =
        await dio.get('https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3');
    if (response.statusCode == 200) {
      List<Movie> MovieFromJson(List<dynamic> lst) {
        return List<Movie>.from(lst.map((x) => Movie.fromJson(x))).toList();
      }

      List<Movie> finalData = MovieFromJson(response.data);
      emit(MovieLoaded(finalData));
    } else {
      emit(MovieFailed("No se cargaron las pelis"));
    }
  }
}
