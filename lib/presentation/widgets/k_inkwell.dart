import 'package:flutter/material.dart';
import '../../utils/text_theme_style_x.dart';

import '../../utils/ui_constant.dart';

class KInkWell extends StatelessWidget {
  const KInkWell(
      {Key? key,
      required this.child,
      this.onTap,
      this.borderRadius,
      this.radius,
      this.rippleColor,
      this.padding,
      this.backgroundColor})
      : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? rippleColor, backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            borderRadius ?? BorderRadius.circular(defaultBorderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius:
              borderRadius ?? BorderRadius.circular(defaultBorderRadius),
          radius: radius,
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return rippleColor?.withOpacity(.12) ??
                  context.color.onPrimaryContainer.withOpacity(0.12);
            }
            if (states.contains(MaterialState.focused)) {
              return rippleColor?.withOpacity(.12) ??
                  context.color.onPrimaryContainer.withOpacity(0.12);
            }
            if (states.contains(MaterialState.pressed)) {
              return rippleColor?.withOpacity(.12) ??
                  context.color.onPrimaryContainer.withOpacity(0.12);
            }
            if (states.contains(MaterialState.selected)) {
              return rippleColor?.withOpacity(.12) ??
                  context.color.onPrimaryContainer.withOpacity(0.12);
            }
            return null;
          }),
          child: child,
        ),
      ),
    );
  }
}
