import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_task/modules/movies/model/movies_model.dart';
import 'package:movies_task/styles/app_color.dart';

class MovieDetailScreen extends StatefulWidget {
  final String heroTag;
  final Movie movie;

  MovieDetailScreen({this.movie, this.heroTag});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  var genresList;

  @override
  void initState() {
    super.initState();

    genresList = List<Widget>.generate(
      widget.movie.genres.length,
      (i) => Text(
        widget.movie.genres[i] + " ,",
        style: TextStyle(color: Colors.white),
      ),
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        brightness: Brightness.dark,
        title: Text(widget.movie.name),
      ),
      body: ListView(
        children: [
          Container(
            width: Get.width,
            height: 300,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.movie.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Genres: ",
                            style:
                                TextStyle(color: AppColors.red, fontSize: 16),
                          ),
                        ]),
                      ),
                      Expanded(
                        child: Wrap(
                          runAlignment: WrapAlignment.start,
                          children: genresList,
                        ),
                      )
                    ],
                  ),
                ),
                detailWidget(
                    title: "Release Year: ", detail: widget.movie.year),
                detailWidget(
                    title: "Director: ", detail: widget.movie.director),
                detailWidget(
                    title: "Main Stars: ", detail: widget.movie.mainStar),
                detailWidget(
                    title: "Description\n", detail: widget.movie.mainStar),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget detailWidget({String title, String detail}) {
    return Visibility(
      visible: detail.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: title ?? "",
                style: TextStyle(color: AppColors.red, fontSize: 16),
              ),
              TextSpan(
                text: detail ?? "",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
