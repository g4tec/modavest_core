import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modavest_core/domain/models/category.dart';

class CardListingCategory extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final Function()? onTap;
  const CardListingCategory({
    Key? key,
    required this.category,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? avatarText;
    if (category.categoryPhotoUrl == null) {
      if (category.description == null) {
        avatarText = "";
      } else if (category.description!.split(" ").length > 1) {
        avatarText =
            "${category.description!.split(" ").first.substring(0, 1)}${category.description!.split(" ").last.substring(0, 1)}";
      } else {
        avatarText = category.description!.substring(0, 1);
      }
      avatarText = avatarText.toUpperCase();
    }
    final Color color = isSelected
        ? Theme.of(context).primaryColor
        : Theme.of(context).canvasColor;
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: ShapeDecoration(
                  color: Colors.transparent,
                  shape: CircleBorder(
                    side: BorderSide(
                      width: 3,
                      color: color,
                    ),
                  ),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: avatarText == null
                      ? StreamBuilder<FileResponse>(
                          stream: DefaultCacheManager().getFileStream(
                            category.categoryPhotoUrl ?? "",
                            withProgress: true,
                          ),
                          builder: (context, snapshot) {
                            Widget body = const Center(
                              child: CircularProgressIndicator(),
                            );
                            if (snapshot.hasError) {
                              body = ListTile(
                                title: const Icon(Icons.image_not_supported),
                                subtitle: Text(snapshot.error.toString()),
                              );
                            }
                            final FileResponse? data = snapshot.data;

                            if (data != null && data is FileInfo) {
                              if (category.categoryPhotoUrl!.contains("svg")) {
                                body = SvgPicture.file(
                                  data.file,
                                  height: 22,
                                  color: color,
                                );
                              } else {
                                body = ClipOval(
                                  child: SizedBox(
                                    width: 100.0,
                                    height: 100.0,
                                    child: Image.file(
                                      data.file,
                                    ),
                                  ),
                                );
                              }
                            }
                            return body;
                          },
                        )
                      : Text(
                          avatarText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: color,
                          ),
                        ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                width: 80,
                height: 40,
                child: Text(
                  category.description ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: color,
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
