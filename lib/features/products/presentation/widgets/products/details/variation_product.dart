import 'package:flutter/material.dart';
import 'package:modavest_core/domain/models/color.dart' as color_entitie;
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';

class VariationProduct extends StatelessWidget {
  final color_entitie.Color color;
  final Function()? onTap;
  final bool isSelected;
  const VariationProduct({
    Key? key,
    required this.color,
    this.onTap,
    this.isSelected = false,
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
              CircleAvatar(
                radius: 50,
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
                            child: ImageColorReferenceView(
                              imageColorReference: color.imgList.first,
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
              SizedBox(
                height: 20.0,
                child: Text(
                  color.name ?? (color.auxiliaryName ?? ""),
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
