import 'package:flutter/material.dart';

Widget customIconButton({
  Widget? child,
  VoidCallback? onTap,
  Color? splashColor,
  Color? backgroundColor,
  BorderRadius? radius,
}) {
  return InkWell(
    borderRadius: radius,
    splashColor: splashColor,
    onTap: onTap,
    child: Ink(
      padding: const EdgeInsets.all(15),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius,
      ),
      child: child,
    ),
  );
}
