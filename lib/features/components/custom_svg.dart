import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';

class CustomSvg extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;
  final BoxFit? fit;

  const CustomSvg(
      {Key? key, required this.icon, this.color, this.fit, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color,
      height: size ?? AppCommonSize.s22,
      width: size ?? AppCommonSize.s22,
      fit: fit ?? BoxFit.contain,
    );
  }
}
