import 'package:flutter/cupertino.dart';

class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String mediaType;
  final double popularity;
  final int voteCount;
  final bool isAdult;
  final double voteAverage;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String overview;
  final String posterPath;

  MovieModel({
    @required this.id,
    @required this.title,
    @required this.releaseDate,
    this.mediaType,
    this.popularity,
    this.voteCount,
    this.isAdult,
    this.voteAverage,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.overview,
    this.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      mediaType: json['media_type'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'],
      isAdult: json['adult'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      genreIds: json['genre_ids'].cast<int>(),
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}
