import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movies_task/modules/movies/controller/movies_list_controller.dart';
import 'package:movies_task/modules/movies/view/movie_detail_screen.dart';
import 'package:movies_task/styles/app_color.dart';
import 'package:movies_task/widgets/movies_grid_tile_builder.dart';

class MoviesListScreen extends StatelessWidget {
  MoviesListController moviesListController = Get.put(MoviesListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          brightness: Brightness.dark,
          title: Text("All Movies"),
        ),
        body: GetBuilder<MoviesListController>(
          init: MoviesListController(),
          builder: (_) {
            if (_.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return StaggeredGridView.countBuilder(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              crossAxisCount: 4,
              itemCount: _.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(MovieDetailScreen(
                      heroTag:
                          "${_.movies[index].id}" + _.movies[index].thumbnail,
                      movie: _.movies[index],
                    ));
                  },
                  child: Hero(
                    tag: "${_.movies[index].id}" + _.movies[index].thumbnail,
                    child: MoviesGridTile(
                      name: _.movies[index].name,
                      thumbnail: _.movies[index].thumbnail,
                      year: _.movies[index].year,
                    ),
                  ),
                );
              },

              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
              //new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
            );
          },
        ));
  }
}
