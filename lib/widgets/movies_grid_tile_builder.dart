import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_task/styles/app_color.dart';

class MoviesGridTile extends StatelessWidget {
  final String name;
  final String year;
  final String thumbnail;

  MoviesGridTile({this.name, this.year, this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Card(
        margin: EdgeInsets.zero,
        color: AppColors.background,
        elevation: 4,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      year ?? "",
                      style: TextStyle(color: AppColors.red),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
