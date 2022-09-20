import 'package:flutter/material.dart';

class ModaVestTextButton extends StatelessWidget {
  final String title;
  final Function? onPressed;
  final double height;
  final double width;
  final double verticalMargin;
  final Color? color;
  final Color? colorText;
  final Color disabledBackgroudColor;
  final Color disabledTextColor;
  final Color disabledBorderColor;
  final bool disableBorder;

  final bool outlined;
  final double borderRadius;
  final bool isLoading;
  final Icon? prefixIcon;
  const ModaVestTextButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.height = 70,
    this.width = double.infinity,
    this.verticalMargin = 10,
    this.color,
    this.borderRadius = 5,
    this.outlined = false,
    this.isLoading = false,
    this.prefixIcon,
    this.disabledBackgroudColor = Colors.grey,
    this.disabledTextColor = Colors.white,
    this.disabledBorderColor = Colors.blueGrey,
    this.colorText,
    this.disableBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalMargin),
      constraints: BoxConstraints(minHeight: height),
      width: width,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (onPressed == null) {
                return disabledBackgroudColor;
              }

              if (outlined) {
                return null;
              }
              if (color != null) {
                return color;
              }
              return Theme.of(context).primaryColor;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (states) {
              return TextStyle(
                fontSize: 23,
                color: Theme.of(context).canvasColor,
              );
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: outlined && !disableBorder
                  ? BorderSide(
                      width: 2,
                      color: onPressed == null
                          ? disabledBorderColor
                          : (color ?? Theme.of(context).primaryColor),
                    )
                  : BorderSide.none,
            ),
          ),
        ),
        onPressed: isLoading ? () {} : onPressed as void Function()?,
        child: FittedBox(
          child: isLoading
              ? CircularProgressIndicator(
                  color: outlined ? color : Theme.of(context).canvasColor,
                )
              : Row(
                  children: [
                    if (prefixIcon != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: prefixIcon,
                      ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: onPressed == null
                            ? disabledTextColor
                            : colorText ??
                                (outlined
                                    ? color ?? Theme.of(context).primaryColor
                                    : Theme.of(context).canvasColor),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
