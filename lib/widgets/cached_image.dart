import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class CachedImgNetwork extends StatelessWidget {
  final String imgUrl;
  const CachedImgNetwork({ required this.imgUrl });
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://image.tmdb.org/t/p/w500${imgUrl}",
      placeholder: (context, url)
      => const CircularProgressIndicator(),
      errorWidget: (context, url, error)
      => const Icon(Icons.error),
    );
  }
}