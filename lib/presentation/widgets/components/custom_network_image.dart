import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/themes.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    required this.imageUrl,
    this.fit,
    this.isPoster = false,
    super.key,
  });
  final String imageUrl;
  final BoxFit? fit;
  final bool isPoster;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (BuildContext context, String url) {
        return const Center(child: CircularProgressIndicator());
      },
      errorWidget: (BuildContext context, String url, dynamic error) {
        return AppCardWidget(
          color: Palette.grey,
          child: ImageAssets.setImage(
            imagePath: ImageAssets.warningImagePath,
          ),
        );
      },
    );
  }
}
