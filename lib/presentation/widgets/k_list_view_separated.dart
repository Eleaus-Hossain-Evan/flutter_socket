import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KListViewSeparated extends StatelessWidget {
  const KListViewSeparated({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.physics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.gap = 10,
    this.separator,
    this.alternateWidget,
    this.controller,
    this.edgePadding,
    this.padding,
    this.reverse = false,
  }) : super(key: key);

  final bool shrinkWrap, reverse;
  final ScrollPhysics physics;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget? separator, alternateWidget;
  final int itemCount;
  final Axis scrollDirection;
  final double gap;
  final ScrollController? controller;
  final double? edgePadding;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return itemCount == 0
        ? Center(child: alternateWidget ?? const Text('No data'))
        : ListView.separated(
            padding: padding ??
                (scrollDirection == Axis.vertical
                    ? EdgeInsets.symmetric(
                        vertical: edgePadding ?? gap.h, horizontal: 10.w)
                    : EdgeInsets.symmetric(
                        horizontal: edgePadding ?? gap.w, vertical: 10.h)),
            scrollDirection: scrollDirection,
            shrinkWrap: shrinkWrap,
            physics: physics,
            itemBuilder: itemBuilder,
            controller: controller,
            reverse: reverse,
            separatorBuilder: (context, index) {
              return separator ??
                  (scrollDirection == Axis.vertical
                      ? SizedBox(
                          height: gap.h,
                        )
                      : SizedBox(
                          width: gap.w,
                        ));
            },
            itemCount: itemCount,
          );
  }
}
