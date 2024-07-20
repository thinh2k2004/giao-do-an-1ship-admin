import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final Color? color;

  const SvgNetwork(
    this.imageUrl, {
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return SizedBox(
        width: width,
        height: height,
        child: Icon(
          Icons.warning,
          color: color,
        ),
      );
    }
    return SvgPicture.network(
      imageUrl,
      fit: boxFit,
      width: width,
      height: height,
      placeholderBuilder: (context) {
        return SizedBox(
          width: width,
          height: height,
          child: Icon(
            Icons.warning,
            color: color,
          ),
        );
      },
    );
  }
}
