// ignore_for_file: depend_on_referenced_packages

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:modavest_core/assets/moda_vest_images.dart';
import 'package:modavest_core/domain/models/color_image_reference.dart';
import 'package:modavest_core/widgets/image/image_color_reference_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class CarouselWithIndicator extends StatefulWidget {
  final List<ImageColorReference> imgList;
  final GlobalKey scaffoldKey;
  final Function(ImageColorReference? imageColorReference)? buildImage;

  final void Function()? onPressBag;
  final void Function()? onPressBack;
  final Stream<int>? bagStream;
  final Stream<InternetConnectionStatus>? streamConection;

  const CarouselWithIndicator({
    Key? key,
    required this.imgList,
    required this.scaffoldKey,
    this.onPressBag,
    this.streamConection,
    this.bagStream,
    this.onPressBack,
    this.buildImage,
  }) : super(key: key);
  @override
  CarouselWithIndicatorState createState() => CarouselWithIndicatorState();
}

class CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  CarouselController carouselController = CarouselController();
  int currentTab = 0;
  ValueNotifier<int> indexPage = ValueNotifier(0);

  Widget buildStack(BuildContext context, int index, {required bool showAll}) {
    final PageController controllerGalery = PageController(initialPage: index);
    final List<ImageColorReference> imgList =
        showAll ? widget.imgList : [widget.imgList.first];
    return Stack(
      children: [
        StreamBuilder<FileResponse>(
          stream: DefaultCacheManager().getFileStream(
            widget.imgList[index].imageSmall ??
                widget.imgList[index].image ??
                "",
            withProgress: true,
          ),
          builder: (context, snapshot) {
            final FileResponse? data = snapshot.data;

            return PhotoViewGallery.builder(
              pageController: controllerGalery,
              onPageChanged: (int value) => indexPage.value = value,
              backgroundDecoration:
                  const BoxDecoration(color: Colors.transparent),
              itemCount: imgList.length,
              builder: (BuildContext contextPhoto, int index) {
                final urlImage = imgList[index].image;
                return PhotoViewGalleryPageOptions(
                  imageProvider: showAll
                      ? NetworkImage(urlImage ?? "")
                      : (data != null && data is FileInfo
                          ? Image.file(
                              data.file,
                            ).image
                          : Image.asset(
                              ModaVestImages.imageNotSuportedWhite,
                            ).image),
                );
              },
            );
          },
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(20.0),
          child: ValueListenableBuilder(
            valueListenable: indexPage,
            builder: (BuildContext context, int value, _) {
              return Text(
                "${value + 1} de ${imgList.length}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 50,
          right: 5,
          child: TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ValueListenableBuilder(
            valueListenable: indexPage,
            builder: (BuildContext context, int value, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (value == 0)
                        const SizedBox()
                      else
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).canvasColor,
                          ),
                          onPressed: () => controllerGalery.previousPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.elasticOut,
                          ),
                        ),
                      if (value != imgList.length - 1)
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).canvasColor,
                          ),
                          onPressed: () => controllerGalery.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeOut,
                          ),
                        )
                      else
                        const SizedBox(),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> openImage(
    BuildContext context,
    int index, {
    required bool showAll,
  }) async {
    indexPage.value = index;
    await showDialog(
      barrierDismissible: true,
      context: widget.scaffoldKey.currentContext ?? context,
      builder: (BuildContext contextDialog) => Dialog(
        elevation: 40,
        insetPadding: const EdgeInsets.all(10),
        backgroundColor: Colors.transparent,
        child: buildStack.call(contextDialog, index, showAll: showAll),
      ),
    );
  }

  Widget buildBody({required bool showAll}) {
    return Stack(
      children: [
        Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height * 0.6,
                onPageChanged: (int index, reason) {
                  setState(() {
                    currentTab = index;
                  });
                },
              ),
              carouselController: carouselController,
              items: widget.imgList.isEmpty
                  ? [
                      Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                      )
                    ]
                  : (showAll ? widget.imgList : [widget.imgList.first])
                      .map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            child: InkWell(
                              child: widget.buildImage != null
                                  ? widget.buildImage?.call(i)
                                  : ImageColorReferenceView(
                                      imageColorReference: i,
                                    ),
                              onTap: () => openImage(
                                context,
                                widget.imgList.indexOf(i),
                                showAll: showAll,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
            ),
            if (widget.imgList.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: (showAll ? widget.imgList : [widget.imgList.first])
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        GestureDetector(
                          onTap: () => carouselController.animateToPage(key),
                          child: Container(
                            decoration: ShapeDecoration(
                              color: currentTab == key
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).unselectedWidgetColor,
                              shape: const CircleBorder(),
                            ),
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 2.0,
                            ),
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).canvasColor,
                    ),
                    onPressed: () => carouselController.previousPage(),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).canvasColor,
                    ),
                    onPressed: () => carouselController.nextPage(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                shape: const CircleBorder(),
                color: Theme.of(context).primaryColor,
                child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  onPressed: widget.onPressBack,
                  // () => getIt<AppNavigator>().pop(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TODO: Favoritar
                  // Material(
                  //   shape: const CircleBorder(),
                  //   color: Theme.of(context).primaryColor,
                  //   child: IconButton(
                  //     color: Theme.of(context).primaryColor,
                  //     icon: Align(
                  //       child: Badge(
                  //         showBadge: false,
                  //         badgeColor: Theme.of(context).canvasColor,
                  //         alignment: Alignment.bottomRight,
                  //         child: Icon(
                  //           Icons.favorite_outline,
                  //           color: Theme.of(context).canvasColor,
                  //         ),
                  //       ),
                  //     ),
                  //     onPressed: () {},
                  //   ),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Material(
                    shape: const CircleBorder(),
                    color: Theme.of(context).primaryColor,
                    child: IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: Align(
                        child: StreamBuilder(
                          stream: widget.bagStream,
                          builder: (context, AsyncSnapshot<int> snapshot) =>
                              Badge(
                            badgeContent: Text((snapshot.data ?? 0).toString()),
                            badgeColor: Theme.of(context).canvasColor,
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              size: 24,
                              color: Theme.of(context).canvasColor,
                            ),
                          ),
                        ),
                      ),
                      onPressed: widget.onPressBag,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.streamConection == null) {
      return buildBody(showAll: true);
    }

    return StreamBuilder(
      stream: widget.streamConection,
      builder: (
        BuildContext context,
        AsyncSnapshot<InternetConnectionStatus> snapshot,
      ) {
        final bool showAll =
            snapshot.data == InternetConnectionStatus.connected;
        return buildBody(showAll: showAll);
      },
    );
  }
}
