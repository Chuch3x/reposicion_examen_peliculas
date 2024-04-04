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


Widget getTextWidgets(List<Result> results) {
  List<Widget> widgets = [];

  for (var result in results) {
    var container = Flexible(
        child: Container(
      color: Colors.green[100],
      child: Text(
        result.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    ));

    widgets.add(container);
  }

  // Return a Row widget containing all the Result widgets
  return GridView.count(
    crossAxisSpacing: 1,
    mainAxisSpacing: 3,
    crossAxisCount: 3,
    children: widgets,
  );
}

class _MovieBuilderState extends State<MovieBuilder> {
  @override
  Widget build(BuildContext context) {
    void _navigate(BuildContext context, Widget page) {
      Future.delayed(Duration(milliseconds: 800), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      });
    }

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
              return getTextWidgets(state.movies.results);
            } else {
              return const Text("fallido");
            }
          },
        ),
      ),
    );
  }
}
