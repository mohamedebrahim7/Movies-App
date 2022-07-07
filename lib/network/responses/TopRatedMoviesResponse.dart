import 'package:dio/dio.dart';
import 'package:fourth_proj/network/models/MovieListResult.dart';
import 'package:fourth_proj/network/requets/TopRatedMoviesRequest.dart';
import 'package:fourth_proj/network/service.dart';
import 'package:json_annotation/json_annotation.dart';
part 'TopRatedMoviesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class TopRatedMoviesResponse {
  final List<MovieListResult> results;

  TopRatedMoviesResponse( this.results);

  factory TopRatedMoviesResponse.fromJson(Map<String, dynamic> json) => _$TopRatedMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMoviesResponseToJson(this);

}