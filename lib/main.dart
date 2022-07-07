import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:fourth_proj/pages/home.dart';
import 'network/requets/TopRatedMoviesRequest.dart';
import 'network/service.dart';

late RestClient client;
late Dio dio;
Future<void> main() async {
  dio = Dio();
  dio.interceptors.add(
    DioCacheManager(
      CacheConfig(
        defaultMaxAge: Duration(minutes: 15),
        defaultMaxStale: Duration(minutes: 15),
      ),
    ).interceptor,
  );
  client = RestClient(dio);
  runApp(Root());
}

class Root extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my app ",
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.deepOrange
        //  primaryColor: Colors.deepOrange
      ),
    );
  }
}
