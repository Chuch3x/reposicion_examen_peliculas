import 'package:reposicion_examen_peliculas/fetchData/movieModel.dart';

class MovieState {
  MovieState();
}

class MovieWaiting extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  MovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class MovieFailed extends MovieState {
  final String message;

  MovieFailed({required this.message});

  @override
  List<Object> get props => [message];
}
