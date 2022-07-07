// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieListResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResult _$MovieListResultFromJson(Map<String, dynamic> json) {
  return MovieListResult(
    (json['vote_average'] as num).toDouble(),
    json['title'] as String,
    json['release_date'] as String,
    json['overview'] as String,
    json['poster_path'] as String,
  );
}

Map<String, dynamic> _$MovieListResultToJson(MovieListResult instance) =>
    <String, dynamic>{
      'vote_average': instance.vote_average,
      'title': instance.title,
      'release_date': instance.release_date,
      'overview': instance.overview,
      'poster_path': instance.poster_path,
    };
