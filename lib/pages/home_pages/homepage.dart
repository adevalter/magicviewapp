import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magicview/bloc/genres_bloc/genres_bloc.dart';
import 'package:magicview/entities/genres.dart';
import 'package:magicview/entities/results.dart';
import 'package:magicview/pages/home_pages/genres_movie_popular_page.dart';
import 'package:magicview/pages/home_pages/genres_page.dart';
import 'package:magicview/pages/home_pages/movie_popular_page.dart';
import 'package:magicview/pages/home_pages/mySearch.dart';
import 'package:magicview/pages/home_pages/serie_popular_page.dart';
import 'package:magicview/utility/data_movie_popular_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int genreIdsDefault = 28;

  @override
  void initState() {
    context.read<GenresBloc>().add(GenresEventFetchs());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "MAGICVIEW ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontFamily: "Righteous",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    MySearch(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Filmes Populares',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                MoviePopularPages(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Series Polulares',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SeriePopularPage(),
                // generos
                const SizedBox(
                  height: 10,
                ),
                GenresPage(),
                const SizedBox(
                  height: 10,
                ),
                GenresMoviePopularPage(),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
