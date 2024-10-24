import 'package:flutter/material.dart';

class AddVariationProduct extends StatelessWidget {
  final Function()? onAddProductVariation;

  const AddVariationProduct({
    Key? key,
    this.onAddProductVariation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GestureDetector(
          onTap: onAddProductVariation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                child: const ClipOval(
                  child: SizedBox(
                    width: 180.0,
                    height: 180.0,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                height: 28.0,
                child: Text(
                  "ADICIONAR COR",
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
