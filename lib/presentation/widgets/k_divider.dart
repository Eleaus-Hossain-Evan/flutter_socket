import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/ui_constant.dart';

class KDivider extends StatelessWidget {
  const KDivider({
    Key? key,
    this.padding,
    this.color,
    this.thickness,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: defaultHorizontalPadding, vertical: 6.h),
      child: Divider(
        thickness: thickness ?? 1.2.h,
        height: 0,
        color: color,
      ),
    );
  }
}
