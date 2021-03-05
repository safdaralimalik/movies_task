import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_task/modules/movies/model/movie_detail_model.dart';
import 'package:movies_task/modules/movies/model/movies_list_model.dart';
import 'package:movies_task/repo/urls.dart';

class RemoteServices {
  static Response response;
  static Dio dio = Dio();

  static Future<MoviesListModel> getAllMovies() async {
    try {
      String url = BASE_URL + GET_ALL_MOVIES;
      print(url);
      response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;
        print(data);
        return MoviesListModel.fromJson(data);
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return null;
    }
  }

  static Future<MovieDetailModel> getMovieDetail(
      {@required String movieId}) async {
    try {
      String url = BASE_URL + GET_MOVIE_DETAIL + movieId;
      print(url);
      response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = response.data;
        print(data);
        return MovieDetailModel.fromJson(data);
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
      return null;
    }
  }
}
