import 'package:json_annotation/json_annotation.dart';
part 'TopRatedMoviesRequest.g.dart';
@JsonSerializable()
class TopRatedMoviesRequest {

  TopRatedMoviesRequest();

  factory TopRatedMoviesRequest.fromJson(Map<String, dynamic> json) => _$TopRatedMoviesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMoviesRequestToJson(this);
}