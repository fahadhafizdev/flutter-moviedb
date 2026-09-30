import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_movie_catalog/core/constants/colors.dart';
import 'package:flutter_movie_catalog/core/core.dart';
import 'package:flutter_movie_catalog/core/src/image_string.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_movie_catalog/data/models/movie_model.dart';

import 'card_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  initState() {
    super.initState();
    getMovieList();
  }

  late Response response;
  Dio dio = Dio();
  String token =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNmIxYWI0NDBiMGEyNWRjMWM4NzdjOTJiYjk5YmM4MyIsIm5iZiI6MTc5MDc4MzAyMy43NTQsInN1YiI6IjZhYmQyZTJmNDZhZDc3Yjg0ZGZkNGM0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QDBOnX5XVtNiAVb8nt6isKu7Wao29Uh3fU6OVlf3dXE";

  MovieModelResponse? movieModelResponse;
  bool isLoading = false;
  void getMovieList() async {
    isLoading = true;
    setState(() {});
    dio = Dio(
      BaseOptions(
        // contentType: isMultipart ? null : Headers.jsonContentType,
        receiveTimeout: const Duration(milliseconds: 15000),
        connectTimeout: const Duration(milliseconds: 15000),
        sendTimeout: const Duration(milliseconds: 15000),
        headers: {
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        },
      ),
    );

    Map<String, dynamic> params = const {};
    Map<String, dynamic> queryParameters = const {
      "language": "en-US",
      "page": 1,
    };

    // dynamic value = jsonEncode(params);

    try {
      response = await dio.get(
        "https://api.themoviedb.org/3/movie/now_playing",
        queryParameters: queryParameters,
        // data: value,
      );

      log("response url: ${response.realUri}");

      if (response.statusCode == 200) {
        log("response: ${response.data}");
        // return response.data;
        movieModelResponse = MovieModelResponse.fromJson(response.data);
      }
      isLoading = false;
      setState(() {});
    } on DioException catch (e) {
      isLoading = false;
      setState(() {});
      log("error: $e");
      log('Status: ${e.response?.statusCode}');
      log('TMDB response: ${e.response?.data}');
      log('URL: ${e.requestOptions.uri}');
    }
  }

  // Future<List<dynamic>> getMovieList() async {
  //   try {
  //     final response = await dio.get<Map<String, dynamic>>(
  //       'https://api.themoviedb.org/3/movie/now_playing',
  //       queryParameters: {
  //         'language': 'en-US',
  //         'page': 1,
  //       },
  //     );

  //     final movies = response.data?['results'] as List<dynamic>? ?? [];
  //     log('Jumlah film: ${movies.length}');

  //     return movies;
  //   } on DioException catch (e) {
  //     log('Request gagal: ${e.message}');
  //     rethrow;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: isLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpaceHeight(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Movie Catalog',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.search, color: AppColors.white),
                        ],
                      ),
                    ),
                    SpaceHeight(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top Movies',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'SEE ALL',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpaceHeight(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SpaceWidth(24),
                          ...movieModelResponse?.results!
                                  .map((movie) => CardMovie(movie: movie))
                                  .toList() ??
                              [],
                        ],
                      ),
                    ),
                    SpaceHeight(34),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular this week',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'SEE ALL',
                            style: TextStyle(
                              color: AppColors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SpaceHeight(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SpaceWidth(24),
                          // CardMovie(),
                          // CardMovie(),
                          // CardMovie(),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
