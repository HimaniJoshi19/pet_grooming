import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_grooming/presentation/themes/themes.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    this.url,
    this.height,
    this.width,
    this.boxFit = BoxFit.fill,
    super.key,
    this.radius = Spacings.custom5,
  });

  final String? url;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    try {
      return Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: CachedNetworkImage(
          imageUrl: url!,
          height: height,
          width: width,
          fit: boxFit,
          errorWidget:
              (BuildContext context, String object, dynamic stackTrace) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(Spacings.custom20),
                child: ImageAssets.setImage(
                  imagePath: ImageAssets.warningImagePath,
                ),
              ),
            );
          },
          // progressIndicatorBuilder: (BuildContext context, String str,
          //     DownloadProgress downloadProgress) {
          //   // (BuildContext context, Widget child,
          //   //     ImageChunkEvent? imageChunkEvent) {
          //   return getShimmerContainer(
          //     height: height ?? Spacings.custom100,
          //     width: width ?? Spacings.custom100,
          //   );
          // },
          placeholder: (BuildContext context, String str) {
            return GetShimmerContainer(
              height: height ?? Spacings.custom100,
              width: width ?? Spacings.custom100,
            );
          },
        ),
      );
    } catch (e) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(Spacings.custom20),
          child: ImageAssets.setImage(imagePath: ImageAssets.warningImagePath),
        ),
      );
    }
  }
}
