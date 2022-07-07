import 'package:flutter/material.dart';
import 'package:fourth_proj/widgets/cached_image.dart';

class MovieDescrbtion extends StatelessWidget {
  final String movie_name;
  final String movie_image;
  final String movie_descrbtion ;
  const MovieDescrbtion( {required this.movie_name, required this.movie_descrbtion, required this.movie_image});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(movie_name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                    child: Expanded(flex:2,child: Center(child:CachedImgNetwork(imgUrl:movie_image) )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                    child: Expanded(flex:1,child: Center(child: Text(movie_descrbtion))),
                  )

                ],
              ),
            ),
          ),
        ));
  }
}