import 'package:reposicion_examen_peliculas/fetchData/movieModel.dart';

class MovieState {
  MovieState();
}

class MovieWaiting extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  MovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieFailed extends MovieState {
  final String message;

  MovieFailed(this.message);

  @override
  List<Object> get props => [message];
}
