import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';

class CardListingBagStore extends StatefulWidget {
  final String image;
  final String title;
  final List<Widget> children;
  final bool showCheckBox;
  final Function(bool)? onChange;
  final Function() onSelectSalesOrder;
  final void Function({required bool value, required String orderId}) onSelect;
  final bool value;
  final String orderId;
  final Widget Function(String) countingBuildWidget;
  final Widget Function(String url)? buildImage;

  const CardListingBagStore({
    super.key,
    required this.onSelect,
    required this.value,
    required this.orderId,
    required this.image,
    this.title = "Loja oficial",
    this.children = const [],
    this.showCheckBox = true,
    this.onChange,
    required this.onSelectSalesOrder,
    required this.countingBuildWidget,
    this.buildImage,
  });

  @override
  CardListingBagStoreState createState() => CardListingBagStoreState();
}

class CardListingBagStoreState extends State<CardListingBagStore> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelectSalesOrder,
      child: ExpansionTile(
        backgroundColor: const Color(0xffe8e8e8),
        maintainState: true,
        onExpansionChanged: (value) {
          widget.onSelectSalesOrder.call();
        },
        collapsedBackgroundColor: const Color(0xffe8e8e8),
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            child: Row(
              children: [
                if (widget.showCheckBox)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        value: widget.value,
                        onChanged: (val) {
                          widget.onSelect
                              .call(value: val!, orderId: widget.orderId);
                          if (widget.onChange != null) {
                            widget.onChange!.call(val);
                          }
                        },
                      ),
                    ),
                  )
                else
                  const SizedBox(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: widget.buildImage?.call(widget.image) ??
                          ImageColorReferenceView(
                            prefixKey: "bagStore",
                            urlImg: widget.image,
                            fit: BoxFit.cover,
                            cacheWidth: 50,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  color: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        widget.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      widget.countingBuildWidget.call(widget.orderId),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        children: widget.children,
      ),
    );
  }
}
