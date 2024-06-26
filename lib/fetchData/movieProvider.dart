import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reposicion_examen_peliculas/fetchData/movieCubit.dart';
import 'package:reposicion_examen_peliculas/fetchData/movierBuilder.dart';

class MovieProvider extends StatelessWidget {
  const MovieProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movie loader",
        home: BlocProvider(create: (_) => MovieCubit(), child: MovieBuilder()));
  }
}
