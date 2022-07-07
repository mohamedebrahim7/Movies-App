// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<TopRatedMoviesResponse> TopRatedMovies(topRatedMoviesRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(topRatedMoviesRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        TopRatedMoviesResponse>(Options(
            method: 'POST', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            'https://api.themoviedb.org/3/movie/top_rated?api_key=c99f0d91ad8856fad96f8b7bd947d071',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TopRatedMoviesResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
