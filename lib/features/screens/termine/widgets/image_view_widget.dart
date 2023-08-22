import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/features/components/custom_image.dart';


class ImageViewWidget extends StatelessWidget {
  final String? imageUrl;

  const ImageViewWidget({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          width: 1.sw,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color(0XFFB9B9B9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomImage(
                  width: 1.sw,
                  imageUrl: imageUrl,
                ),
              ),
              kHeightBox35,
            ],
          ),
        ),
      ),
    );
  }
}
