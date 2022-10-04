import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:image/image.dart' as image_convert;
import 'package:path_provider/path_provider.dart';

class ModaVestImageUploadFiled extends StatefulWidget {
  final String? initialPhoto;

  const ModaVestImageUploadFiled({Key? key, this.initialPhoto})
      : super(key: key);
  @override
  ModaVestImageUploadFiledState createState() =>
      ModaVestImageUploadFiledState();
}

class ModaVestImageUploadFiledState extends State<ModaVestImageUploadFiled> {
  File? image;
  Future getImage(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        final image_convert.Image? img =
            image_convert.decodeImage(image!.readAsBytesSync());
        final imgResized = image_convert.copyResize(img!, width: 400);
        final directory = await getApplicationDocumentsDirectory();

        final String convertedImageDir =
            "${directory.path}/${DateTime.now().toString()}document.png";

        File(convertedImageDir)
            .writeAsBytesSync(image_convert.encodePng(imgResized));

        final File fileConverted = File(convertedImageDir);
        setState(() {
          image = fileConverted;
        });
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(ModaVestLabels.sucessToLoadImage),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ModaVestLabels.failToLoadImage),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        children: <Widget>[
          Align(
            child: Container(
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).cardColor,
                child: ClipOval(
                  child: SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: image != null
                        ? Image.file(
                            image!,
                            fit: BoxFit.cover,
                          )
                        : (widget.initialPhoto != null
                            ? Image.network(
                                widget.initialPhoto!,
                                fit: BoxFit.cover,
                              )
                            : const SizedBox()),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColor,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                color: Theme.of(context).canvasColor,
                icon: const Icon(
                  Icons.add,
                  size: 30.0,
                ),
                onPressed: () {
                  getImage(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
