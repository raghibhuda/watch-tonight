import 'package:flutter/cupertino.dart';

class MovieDetailsModel{
  final bool isAdult;
  final String backdropPath;
  final Null belongsToCollection;
  final int budget;
  final List<Genres> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguages> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetailsModel({
    this.isAdult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount
  });

  factory MovieDetailsModel.fromJson(Map<String , dynamic>json) {

    List<Genres> _genres(Map<String,dynamic>json){
      final genres = <Genres>[];
      if(json['genres'] != null){
        json['genres'].forEach((v){
          genres.add(new Genres.fromJson(v));
        });
      }
      return genres;
    }

    List<SpokenLanguages> _spokenLanguages(Map<String,dynamic>json){
      final spokenLanguages = <SpokenLanguages>[];
      if(json['genres'] != null){
        json['genres'].forEach((v){
          spokenLanguages.add(new SpokenLanguages.fromJson(v));
        });
      }
      return spokenLanguages;
    }

    return MovieDetailsModel(
      isAdult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'],
      budget: json['budget'],
      genres: _genres(json),
      homepage: json['adult'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: _spokenLanguages(json),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );

  }
}


class Genres{
  final int id;
  final String name;

  const Genres({@required this.id, @required this.name});

  factory Genres.fromJson(Map<String , dynamic>json){
    return Genres(
      id: json['id'],
      name: json['name']
    );
  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class SpokenLanguages{
  final String englishName;
  final String iso6391;
  final String name;

  SpokenLanguages({
    @required this.englishName,
    @required this.iso6391,
    @required this.name,
  });

  factory SpokenLanguages.fromJson(Map<String, dynamic>json){
    return SpokenLanguages(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name']
    );
  }

  Map<String, dynamic>toJson(){
    final Map<String,dynamic> data = new Map<String, dynamic>();
    data['english_name'] = this.englishName;
    data['iso_639_1'] = this.iso6391;
    data['name'] = this.name;
    return data;
  }
}