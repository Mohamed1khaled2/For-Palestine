import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? widthPlaceHolder;
  final EdgeInsetsGeometry? margin;
  const CustomImage(
      {super.key,
      required this.url,
      this.width,
      this.margin,
      this.widthPlaceHolder});

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width ?? 180.w,
        height: 160.h,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container
        (
          margin: EdgeInsets.only(
              left: 8.w, right: 8.w, top: 8),
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(15.w)),
          width: widthPlaceHolder ?? 180.w,

          height: 160.h),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
