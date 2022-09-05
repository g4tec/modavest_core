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

        body = Image.network(
          imageColorReference?.imageMedium ?? urlImg!,
          fit: fit ?? BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        );

        return body;
      },
    );
  }
}
