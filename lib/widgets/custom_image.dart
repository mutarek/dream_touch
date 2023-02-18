import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

Widget circularImage(String imageUrl, double height, double width) {
  return CachedNetworkImage(
      cacheKey: imageUrl,
      placeholder: (context, url) => const Center(child: CupertinoActivityIndicator()),
      errorWidget: (context, url, error) => Image.network("https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png", fit: BoxFit.fill, width: height, height: width),
      imageBuilder: (context, imageProvider) => Container(
          width: height,
          height: width,
          decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: imageProvider, fit: BoxFit.cover))),
      fit: BoxFit.fill,
      imageUrl: imageUrl);
}