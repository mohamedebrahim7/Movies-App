import 'package:dio/dio.dart';
import 'package:fourth_proj/network/responses/TopRatedMoviesResponse.dart';
import 'package:retrofit/retrofit.dart';
import 'requets/TopRatedMoviesRequest.dart';
part 'service.g.dart';

@RestApi()
abstract class RestClient {

  factory RestClient(Dio dio) = _RestClient;

  @POST('https://api.themoviedb.org/3/movie/top_rated?api_key=c99f0d91ad8856fad96f8b7bd947d071')
  Future<TopRatedMoviesResponse> TopRatedMovies(
      @Body() TopRatedMoviesRequest topRatedMoviesRequest,
      );

}