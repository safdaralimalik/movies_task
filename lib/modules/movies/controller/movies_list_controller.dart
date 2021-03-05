import 'package:get/get.dart';
import 'package:movies_task/modules/movies/model/movies_list_model.dart';
import 'package:movies_task/modules/movies/model/movies_model.dart';
import 'package:movies_task/repo/remote_services.dart';

class MoviesListController extends GetxController {
  bool isLoading = false;

  List<Movie> movies = [];

  void getAllMovies() async {
    isLoading = true;
    update();

    MoviesListModel allMovies = await RemoteServices.getAllMovies();
    isLoading = false;
    update();

    if (allMovies != null) {
      movies = allMovies.data.movies;
      update();
    }
  }

  @override
  void onInit() {
    getAllMovies();

    // TODO: implement onInit
    super.onInit();
  }
}
