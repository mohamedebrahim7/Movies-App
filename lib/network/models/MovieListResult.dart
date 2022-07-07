import 'package:json_annotation/json_annotation.dart';
part 'MovieListResult.g.dart';
@JsonSerializable()
class MovieListResult {
  final double vote_average;
  final String title;
  final String release_date;
  final String overview;
  final String poster_path;
  MovieListResult(this.vote_average, this.title, this.release_date,  this.overview, this.poster_path);

  factory MovieListResult.fromJson(Map<String, dynamic> json) =>  _$MovieListResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResultToJson(this);
}