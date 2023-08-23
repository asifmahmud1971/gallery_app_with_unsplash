import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_images.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_image.dart';
import 'package:unsplash_gallery/features/components/custom_time_formatter.dart';
import 'package:unsplash_gallery/features/screens/gallery/model/gallery_model.dart';

class GalleryCardWidget extends StatelessWidget {
  final VoidCallback? onView;
  final VoidCallback? onEdit;
  final GalleryModel? galleryModel;
  final bool isToday;
  const GalleryCardWidget(
      {super.key,
      this.onView,
      this.galleryModel,
      this.onEdit,
      this.isToday = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onView,
      child: Container(
        padding: EdgeInsets.all(AppCommonSize.s15),
        decoration: BoxDecoration(
          color: AppColors.kWhiteColorOne,
          /* borderRadius: BorderRadius.circular(AppCommonSize.s10),*/
          boxShadow: [AppColors.kOrdinaryShadow],
          border: Border.all(
            width: 1,
            color: AppColors.kGrayColorThree,
          ),
        ),
        child: CustomImage(
          imageUrl: galleryModel?.urls?.small,
        ),
      ),
    );
  }
}
