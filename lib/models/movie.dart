// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:notnetflix/services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;
  Movie({
    required this.id,
    required this.name,
    required this.description,
     this.posterPath,
  });
  

  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? posterPath,
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ,
      name: map['title'],
      description:map['overview'] ,
      posterPath: map['poster_path'] ,
    );
  }

  String posterURL() {
    API api =API();
    return api.baseImageURL + posterPath!;
  }

 

  

  


}
