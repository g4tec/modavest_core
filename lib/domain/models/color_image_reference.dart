import 'package:equatable/equatable.dart';

class ImageColorReference extends Equatable {
  final String sequence;
  final String? image;
  final String? imageMedium;
  final String? imageSmall;

  const ImageColorReference({
    required this.sequence,
    required this.image,
    required this.imageMedium,
    required this.imageSmall,
  });

  @override
  List<Object?> get props => [
        sequence,
        image,
        imageMedium,
        imageSmall,
      ];
}
