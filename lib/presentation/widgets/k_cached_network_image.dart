import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/api_routes.dart';

class KCachedNetworkImageNoBase extends StatelessWidget {
  const KCachedNetworkImageNoBase({
    Key? key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
  }) : super(key: key);

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    const defaultImage =
        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png';

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height ?? double.infinity,
        maxWidth: width ?? double.infinity,
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl.isNotEmpty ? imageUrl : defaultImage,
        fit: fit,
        imageBuilder: (context, imageProvider) {
          return ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Colors.grey[200],
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: child,
            ),
          );
        },
        height: height,
        width: width,
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: SizedBox(
            height: 30.h,
            width: 30.h,
            child: CircularProgressIndicator(
              value: progress.progress,
              strokeWidth: .8.w,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        // placeholder: (context, url) => const Icon(Icons.error),
      ),
    );
  }
}

class KCachedNetworkImageWdLoading extends StatelessWidget {
  const KCachedNetworkImageWdLoading({
    Key? key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
  }) : super(key: key);

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: height ?? double.infinity,
        maxWidth: width ?? double.infinity,
      ),
      child: CachedNetworkImage(
        imageUrl: "${APIRoute.BASE_URL}$imageUrl",

        fit: fit,
        imageBuilder: (context, imageProvider) {
          return Container(
            width: width ?? double.infinity,
            height: height ?? double.infinity,
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: backgroundColor ?? Colors.transparent,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: child,
          );
        },
        height: height,
        width: width,
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: SizedBox(
            height: 30.h,
            width: 30.h,
            child: CircularProgressIndicator(
              value: progress.progress,
              strokeWidth: .8.w,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        // placeholder: (context, url) => const Icon(Icons.error),
      ),
    );
  }
}

class KCachedNetworkImage extends StatelessWidget {
  const KCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.zero),
    this.height = 200,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
  }) : super(key: key);

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    //const defaultImage = 'https://i.stack.imgur.com/vT8DJ.gif';

    return ClipRRect(
      borderRadius: borderRadius,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height ?? double.infinity,
          maxWidth: width ?? double.infinity,
        ),
        child: imageUrl.isEmpty
            ? const SizedBox.expand()
            : CachedNetworkImage(
                imageUrl: "${APIRoute.BASE_URL}$imageUrl",
                fit: fit,
                // imageBuilder: (context, imageProvider) {
                //   return ClipRRect(
                //     borderRadius: borderRadius,
                //     child: Container(
                //       width: width ?? double.infinity,
                //       height: height ?? double.infinity,
                //       padding: padding,
                //       margin: margin,
                //       decoration: BoxDecoration(
                //         borderRadius: borderRadius,
                //         color: backgroundColor ?? Colors.transparent,
                //         image: DecorationImage(
                //           image: imageProvider,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       child: child,
                //     ),
                //   );
                // },
                height: height,
                width: width,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: SizedBox(
                    height: 30.h,
                    width: 30.h,
                    child: CircularProgressIndicator(
                      value: progress.progress,
                      strokeWidth: .8.w,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                // placeholder: (context, url) => const Icon(Icons.error),
              ),
      ),
    );
  }
}
