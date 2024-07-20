import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit boxFit;

  const ImageNetwork({
    required this.imageUrl,
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
    Key? key,
  }) : super(key: key);

  // int? get _memCacheWidth {
  //   if (width != null && width != double.infinity) {
  //     return (width! * 2.5).toInt();
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return SizedBox(
        width: width,
        height: height,
        child: const Icon(Icons.image_not_supported),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: boxFit,
      width: width,
      height: height,
      // memCacheWidth: _memCacheWidth,
      placeholder: (context, url) {
        return SizedBox(
          width: width,
          height: height,
          child: const CupertinoActivityIndicator(),
        );
      },
      errorWidget: (context, url, error) {
        return SizedBox(
          width: width,
          height: height,
          child: const Icon(Icons.image_not_supported),
        );
        // return Image.asset(
        //   'assets/icons/warring.png',
        //   width: width,
        //   height: height,
        // );
      },
    );
  }
}
