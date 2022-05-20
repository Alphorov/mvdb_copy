import 'package:flutter/painting.dart';

class Movie {
  Movie({
    required this.mainActors,
    required this.percent,
    required this.backImg,
    required this.mainImg,
    required this.title,
    required this.dateOfRelease,
    required this.description,
  });
  final AssetImage backImg;
  final AssetImage mainImg;
  final String title;
  final String dateOfRelease;
  final String description;
  final int percent;
  final List<Actor> mainActors;
}

class Actor {
  Actor(this.name, this.photo);
  final String name;
  final AssetImage photo;
}
