import 'package:equatable/equatable.dart';

class ImageColorReference extends Equatable {
  final String sequence;
  final String? image;
  final String? imageMedium;
  final String? imageSmall;
  final String? referenceCode;
  final String? colorCode;
  final bool? isDefault;

  const ImageColorReference({
    required this.sequence,
    required this.image,
    required this.imageMedium,
    required this.imageSmall,
    this.referenceCode,
    this.colorCode,
    this.isDefault,
  });

  @override
  List<Object?> get props => [
        sequence,
        image,
        imageMedium,
        imageSmall,
      ];
}
