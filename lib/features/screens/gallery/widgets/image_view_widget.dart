import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_image.dart';
import 'package:unsplash_gallery/features/components/custom_snackbar.dart';
import 'package:unsplash_gallery/features/components/default_btn.dart';
import 'package:unsplash_gallery/features/screens/gallery/widgets/download_widget.dart';

class ImageViewWidget extends StatelessWidget {
  final String? imageUrl;
  final String? fullImage;

  const ImageViewWidget({Key? key, this.imageUrl, this.fullImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      bottomNavigationBar: DefaultBtn(
        title: 'Save to gallery',
        btnColor: AppColors.kPurpleColorFour,
        onPress: () async {
          if (await Permission.storage.request().isGranted) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return DownloadingDialog(
                    url: fullImage,
                  );
                });
          } else {
            showCustomSnackBar(
                context: context, message: "Storage permission needed");
          }
        },
      ),
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
