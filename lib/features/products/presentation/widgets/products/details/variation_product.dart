import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/color.dart' as color_entitie;
import 'package:modavest_core/domain/models/color_image_reference.dart';
import 'package:modavest_core/domain/models/product.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';

class VariationProduct extends StatelessWidget {
  final color_entitie.Color color;
  final Function()? onTap;
  final bool isSelected;
  final Function(ImageColorReference? imageColorReference)? buildImage;
  final ValueNotifier<Map<Product, num?>>? badgeQuantity;

  const VariationProduct({
    Key? key,
    required this.color,
    this.onTap,
    this.isSelected = false,
    this.buildImage,
    this.badgeQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: isSelected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).secondaryHeaderColor,
                    child: ClipOval(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: color.imgList.isNotEmpty
                            ? Opacity(
                                opacity: isSelected ? 0.5 : 1,
                                child: buildImage != null
                                    ? buildImage?.call(color.imgList.first)
                                    : ImageColorReferenceView(
                                        imageColorReference:
                                            color.imgList.first,
                                      ),
                              )
                            : Opacity(
                                opacity: isSelected ? 0.8 : 1,
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ValueListenableBuilder(
                        valueListenable: badgeQuantity ??
                            ValueNotifier<Map<Product, num?>>({}),
                        builder: (context, value, _) {
                          final num? badgeQuantity = value.entries.fold(
                            0,
                            (previousValue, element) =>
                                (previousValue ?? 0) +
                                (element.key.colorCode == color.code
                                    ? element.value ?? 0
                                    : 0),
                          );
                          return Visibility(
                            visible: (badgeQuantity ?? 0) > 0,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              constraints: const BoxConstraints(
                                  minHeight: 30, minWidth: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(180),
                                color: Theme.of(context).canvasColor,
                              ),
                              child: Center(
                                child: Text((badgeQuantity ?? 0)
                                    .toString()
                                    .replaceAll('.', ',')),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                height: 28.0,
                child: Text(
                  (color.name ?? (color.auxiliaryName ?? "")).toUpperCase(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
