import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/color_image_reference.dart';

class ImageColorReferenceView extends StatelessWidget {
  final ImageColorReference? imageColorReference;
  final String? urlImg;
  final BoxFit? fit;
  const ImageColorReferenceView({
    Key? key,
    this.imageColorReference,
    this.urlImg,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageColorReference == null && urlImg == null) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        child: const Icon(Icons.image_not_supported),
      );
    }

    return Builder(
      builder: (
        context,
      ) {
        Widget body = const Center(child: CircularProgressIndicator());
        final String url = imageColorReference?.imageMedium ??
            imageColorReference?.imageSmall ??
            imageColorReference?.image ??
            urlImg ??
            "";
        body = Image.network(
          url,
          fit: fit ?? BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return FittedBox(
                fit: fit ?? BoxFit.cover,
                child: Container(
                  constraints: const BoxConstraints(
                    minHeight: 2.0,
                    minWidth: 2.0,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: fit ?? BoxFit.cover,
                    ),
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            padding: const EdgeInsets.all(20.0),
            child: const Icon(Icons.image_not_supported),
          ),
        );
        return body;
      },
    );
  }
}
