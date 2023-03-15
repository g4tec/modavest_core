import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/color_image_reference.dart';

class ImageColorReferenceView extends StatelessWidget {
  final ImageColorReference? imageColorReference;
  final String? urlImg;
  final BoxFit? fit;
  final int? cacheWidth;
  final String? prefixKey;
  const ImageColorReferenceView({
    Key? key,
    this.imageColorReference,
    this.urlImg,
    this.fit,
    this.cacheWidth,
    this.prefixKey,
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
      key: ValueKey(
          "${prefixKey ?? ""}${imageColorReference?.image ?? (urlImg ?? "")}builder"),
      builder: (
        context,
      ) {
        Widget body = const Center(child: CircularProgressIndicator());
        final String url = imageColorReference?.imageMedium ??
            imageColorReference?.imageSmall ??
            imageColorReference?.image ??
            urlImg ??
            "";
        body = Image.network(url,
            key: ValueKey("${prefixKey ?? ""}${url ?? ""}viewer "),
            fit: fit ?? BoxFit.cover,
            width: MediaQuery.of(context).size.width, loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        }, errorBuilder: (context, error, stackTrace) {
          print(error);
          print(stackTrace);
          return Container(
            padding: const EdgeInsets.all(20.0),
            child: const Icon(
              Icons.image_not_supported,
              color: Colors.red,
            ),
          );
        });
        return body;
      },
    );
  }
}
