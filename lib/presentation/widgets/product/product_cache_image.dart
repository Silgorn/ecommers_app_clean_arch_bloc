import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommers_app2/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductCacheImage extends StatelessWidget {
  final String imageUrl;
  final double width, height;

  const ProductCacheImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height});

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return _imageWidget(imageProvider);
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(
            color: TColors.accent,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return const Text('No image');
      },
    );
  }
}
