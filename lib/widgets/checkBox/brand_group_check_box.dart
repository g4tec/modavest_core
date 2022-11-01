import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/brand.dart';
import 'package:modavest_core/widgets/checkBox/modavest_check_box.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';

class BrandGroupCheckBox extends StatefulWidget {
  final List<Brand> brands;
  final List<Brand> selectedBrands;
  final void Function(Brand) setBrand;
  const BrandGroupCheckBox({
    super.key,
    required this.brands,
    required this.selectedBrands,
    required this.setBrand,
  });

  @override
  State<BrandGroupCheckBox> createState() => _BrandGroupCheckBoxState();
}

class _BrandGroupCheckBoxState extends State<BrandGroupCheckBox> {
  Widget _buildBrands(
    List<Brand> brands,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ModaVestLabels.brands.toUpperCase(),
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
          ),
          ..._buildBrandsChecks(brands),
        ],
      ),
    );
  }

  List<Widget> _buildBrandsChecks(List<Brand> brands) {
    final List<Widget> brandsWidgets = [];
    for (final Brand brand in brands) {
      brandsWidgets.add(
        InkWell(
          onTap: () => widget.setBrand(brand),
          child: Row(
            children: [
              ModavestCheckBox(
                onSelect: () => widget.setBrand(brand),
                value: widget.selectedBrands.any(
                  (element) => element.brandId == brand.brandId,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 5),
                width: 24,
                height: 24,
                child: brand.brandPhotoUrl != null
                    ? FittedBox(
                        child: ImageColorReferenceView(
                          urlImg: brand.brandPhotoUrl,
                        ),
                      )
                    : FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          child: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              brand.brandName ?? "B".substring(0, 1),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
              Text(
                brand.brandName ?? '',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      );
    }
    return brandsWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildBrands(widget.brands));
  }
}
