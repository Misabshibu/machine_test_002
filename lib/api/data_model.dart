// To parse this JSON data, do
//
//     final MovieData = welcomeFromJson(jsonString);

import 'dart:convert';

List<MovieData> movieDataFromJson(String str) =>
    List<MovieData>.from(json.decode(str).map((x) => MovieData.fromJson(x)));

String movieDataToJson(List<MovieData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieData {
  final int rank;
  final String title;
  final String thumbnail;
  final String rating;
  final String id;
  final int year;
  final String image;
  final String description;
  final String trailer;
  final List<String> genre;
  final List<String> director;
  final List<String> writers;
  final String imdbid;

  MovieData({
    required this.rank,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.image,
    required this.description,
    required this.trailer,
    required this.genre,
    required this.director,
    required this.writers,
    required this.imdbid,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
        rank: json["rank"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        rating: json["rating"],
        id: json["id"],
        year: json["year"],
        image: json["image"],
        description: json["description"],
        trailer: json["trailer"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        director: List<String>.from(json["director"].map((x) => x)),
        writers: List<String>.from(json["writers"].map((x) => x)),
        imdbid: json["imdbid"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "title": title,
        "thumbnail": thumbnail,
        "rating": rating,
        "id": id,
        "year": year,
        "image": image,
        "description": description,
        "trailer": trailer,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "director": List<dynamic>.from(director.map((x) => x)),
        "writers": List<dynamic>.from(writers.map((x) => x)),
        "imdbid": imdbid,
      };
}
