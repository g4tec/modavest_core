import 'package:flutter/material.dart';
import 'package:modavest_core/widgets/filterMenu/filter_drawer_menu.dart';

void showFilter({
  required BuildContext context,
  required Map<String, String> options,
  void Function(List<String>?)? onChange,
  void Function()? onFilter,
  void Function()? onClear,
  List<String>? values,
  List<Widget>? children,
  String? title,
  String? subTitle,
}) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black12.withOpacity(0.1),
    barrierLabel: 'filterDrawer',
    barrierDismissible: true,
    transitionBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> animationSecondary,
      Widget child,
    ) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInToLinear,
          ),
        ),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 450),
    pageBuilder: (
      BuildContext contextBuilder,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return FilterDrawerMenu(
        options: options,
        onChange: onChange,
        values: values,
        title: title,
        subTitle: subTitle,
        onFilter: onFilter,
        onClear: onClear,
        showOptionsOnBottom: true,
        children: children,
      );
    },
  );
}
