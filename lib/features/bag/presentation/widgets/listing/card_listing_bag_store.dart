import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';

class CardListingBagStore extends StatefulWidget {
  final String image;
  final String title;
  final Widget child;
  final bool showCheckBox;
  final Function(bool)? onChange;
  final Function() onSelectSalesOrder;
  final void Function({required bool value, required String orderId}) onSelect;
  final bool value;
  final String orderId;
  final Widget Function(String) countingBuildWidget;
  final Widget Function(String url)? buildImage;
  final Function() onExpand;

  const CardListingBagStore({
    super.key,
    required this.onExpand,
    required this.onSelect,
    required this.value,
    required this.orderId,
    required this.image,
    this.title = "Loja oficial",
    required this.child,
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
    final aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return GestureDetector(
      onTap: () {
        widget.onSelectSalesOrder.call();
      },
      child: ListTile(
        // backgroundColor: const Color(0xffe8e8e8),
        // maintainState: true,
        // onExpansionChanged: (value) {
        //   widget.onSelectSalesOrder.call();
        // },
        // collapsedBackgroundColor: const Color(0xffe8e8e8),

        title: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: aspectRatio < 0.6 ? 16 : 32),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFE4E4E4), width: 1),
                borderRadius: BorderRadius.circular(8)),
          ),
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
                Container(
                  height: MediaQuery.of(context).size.width *
                      (aspectRatio < 0.6 ? 0.2 : 0.18),
                  width: MediaQuery.of(context).size.width *
                      (aspectRatio < 0.6 ? 0.3 : 0.22),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: widget.buildImage?.call(widget.image) ??
                          ImageColorReferenceView(
                            prefixKey: "bagStore",
                            urlImg: widget.image,
                            fit: BoxFit.cover,
                            cacheWidth: 180,
                          ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AutoSizeText(
                        widget.title,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      FittedBox(
                        child: widget.countingBuildWidget.call(widget.orderId),
                      ),
                      widget.child,
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  alignment: Alignment.topCenter,
                  child: IconButton(
                    onPressed: widget.onExpand,
                    icon: const Icon(Icons.expand_more),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
