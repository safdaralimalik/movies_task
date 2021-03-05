import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_task/modules/movies/model/movie_detail_model.dart';
import 'package:movies_task/modules/movies/model/movies_model.dart';
import 'package:movies_task/repo/remote_services.dart';

class MovieDetailController extends GetxController {
  final String movieId;

  MovieDetailController({@required this.movieId});

  bool isLoading = false;

  Movie movieDetail;

  void getMovieDetail() async {
    isLoading = true;
    update();
    MovieDetailModel movieDetailModel =
        await RemoteServices.getMovieDetail(movieId: movieId);
    isLoading = true;
    update();
    if (movieDetailModel != null) {
      movieDetail = movieDetailModel.data.movie;
    }
  }
}
