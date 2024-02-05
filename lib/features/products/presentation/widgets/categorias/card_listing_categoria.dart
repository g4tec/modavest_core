import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modavest_core/domain/models/category.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';

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
    final Color color =
        isSelected ? Theme.of(context).primaryColor : Color(0xFFCACACA);
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                position: DecorationPosition.foreground,
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
                  backgroundColor: Colors.white,
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
                              if (category.categoryPhotoUrl!.contains("png") ||
                                  category.categoryPhotoUrl!.contains("jpg")) {
                                body = ClipOval(
                                  child: SizedBox(
                                    width: 100.0,
                                    height: 100.0,
                                    child: Image.file(
                                      data.file,
                                    ),
                                  ),
                                );
                              } else {
                                body = SvgPicture.file(
                                  data.file,
                                  height: 22,
                                  // color: color,
                                  color: Color(0xFF4F4F4F),
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
                            color: Color(0xFF4F4F4F),
                          ),
                        ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                width: 90,
                height: 40,
                child: AutoSizeText(
                  category.description ?? "",
                  minFontSize: 10,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: color,
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
