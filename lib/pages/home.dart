import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fourth_proj/network/models/MovieListResult.dart';
import 'package:fourth_proj/network/requets/TopRatedMoviesRequest.dart';
import 'package:fourth_proj/network/service.dart';
import 'package:fourth_proj/pages/movie_descrbtion.dart';
import 'package:fourth_proj/widgets/cached_image.dart';

class Home extends StatefulWidget {
  const Home();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<MovieListResult>> FutureData;

  @override
  void initState() {
    super.initState();
    FutureData = getData();
    connectionvia();
  }

  Future<List<MovieListResult>> getData() async {
    RestClient client = RestClient(Dio());
    return await client.TopRatedMovies(TopRatedMoviesRequest()).then((value) {
      return value.results;
    });
  }

  void connectionvia() async{
    var status = await Connectivity().checkConnectivity();
    switch (status) {
      case ConnectivityResult.wifi:
        showToast("Connected via wifi");
        debugPrint("Connected via wifi");
        break;
      case ConnectivityResult.mobile:
        showToast("Connected via mobile");
        debugPrint("Connected via mobile");
        break;
      case ConnectivityResult.none:
        showToast("No internet connection");
        debugPrint("not connected");
        break;
    }
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            "Movies",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FutureBuilder<List<MovieListResult>>(
            builder: (ctx, snapshot) {
              // Checking if future is resolved or not
              if (snapshot.connectionState == ConnectionState.done) {
                // If we got an error
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      //'${snapshot.error} occured',
                      "error occured",
                      style: TextStyle(fontSize: 18),
                    ),
                  );

                  // if we got our data
                } else if (snapshot.hasData) {
                  // Extracting data from snapshot object
                  final List<MovieListResult> topRatedMovieList = snapshot.data!;

                  return ListView.builder(
                    itemCount: topRatedMovieList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                              title: Text(topRatedMovieList[index].title),
                              subtitle: Text(topRatedMovieList[index].release_date),
                              leading: ClipOval(
                                child: CachedImgNetwork(imgUrl: topRatedMovieList[index].poster_path,),

                              ),

                              trailing: Text("${topRatedMovieList[index].vote_average.toString()}/10"),



                              onTap:
                                  () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>
                                        MovieDescrbtion(movie_name: topRatedMovieList[index].title,
                                            movie_image: topRatedMovieList[index].poster_path,
                                            movie_descrbtion:topRatedMovieList[index].overview),
                ),
              )
                              ),
                        ),
                      );
                    },
                  );
                }
              }

              // Displaying LoadingSpinner to indicate waiting state
              return Center(
                child: CircularProgressIndicator(),
              );
            },

            future: FutureData,
          )),
    ));
  }
}
