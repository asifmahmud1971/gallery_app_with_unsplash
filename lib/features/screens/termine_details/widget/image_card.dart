import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/features/components/custom_svg.dart';

class ImageCard extends StatelessWidget {
  final String? fileName;
  final VoidCallback? onDelete;
  final bool? isNetworkImage;

  const ImageCard(
      {Key? key, this.fileName, this.onDelete, this.isNetworkImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 5),
      child: Stack(
        children: [
          Container(
              clipBehavior: Clip.antiAlias,
              height: 65.r,
              width: 65.r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12),
              child: isNetworkImage!
                  ? Image.network(
                      fileName!,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(fileName ?? ""),
                      fit: BoxFit.cover,
                    )),
          Positioned(
              bottom: 2,
              right: 2,
              child: InkWell(
                onTap: onDelete ?? () {},
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  padding: EdgeInsets.only(top: 2),
                  child: Center(
                    child: CustomSvg(
                      icon: AppImages.iconsDelete,
                      size: 30.r,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
