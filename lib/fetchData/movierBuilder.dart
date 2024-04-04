import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reposicion_examen_peliculas/fetchData/movieCubit.dart';
import 'package:reposicion_examen_peliculas/fetchData/movieModel.dart';
import 'package:reposicion_examen_peliculas/fetchData/movieState.dart';

class MovieBuilder extends StatefulWidget {
  const MovieBuilder({super.key});

  @override
  State<MovieBuilder> createState() => _MovieBuilderState();
}

class _MovieBuilderState extends State<MovieBuilder> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts rating")),
      body: Container(
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MovieWaiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  return getTextWidgets(state.movies[index].results);
                },
              );
              // debugPrint(state.movies.toString());
              // return const Text("data");
            } else {
              return const Text("Fallido");
            }
          },
        ),
      ),
    );
  }

  Widget getTextWidgets(List<Result> results) {
    return GridView.count(
      crossAxisSpacing: 1,
      mainAxisSpacing: 3,
      crossAxisCount: 3,
      children: results
          .map(
            (result) => Container(
              color: Colors.green[100],
              child: Text(
                result.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          )
          .toList(),
    );
  }
}
