// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TopRatedMoviesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedMoviesResponse _$TopRatedMoviesResponseFromJson(
    Map<String, dynamic> json) {
  return TopRatedMoviesResponse(
    (json['results'] as List<dynamic>)
        .map((e) => MovieListResult.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TopRatedMoviesResponseToJson(
        TopRatedMoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
