import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_appbar.dart';
import 'package:unsplash_gallery/features/components/custom_button.dart';
import 'package:unsplash_gallery/features/components/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Signup",
        onBackPress: ()=>Navigator.of(context).pop(),
      ),
      body:  SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppCommonSize.s15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeightBox25,
              CustomTextField(
                controller: null,
                hint: "Enter your Name",
                hintColor: AppColors.kGrayColorTwo,
              ),
              CustomTextField(
                controller: null,
                hint: "Enter your Email",
                hintColor: AppColors.kGrayColorTwo,
              ),
              CustomTextField(
                controller: null,
                hint: "Enter your Phone",
                hintColor: AppColors.kGrayColorTwo,
              ),
              CustomTextField(
                controller: null,
                hint: "Enter your Gender",
                hintColor: AppColors.kGrayColorTwo,
              ),
              CustomTextField(
                controller: null,
                hint: "Enter your Password",
                hintColor: AppColors.kGrayColorTwo,
              ),
              kHeightBox25,
              CustomButton(
                onPress: () {
                  //printLog("object");
                },
                title: "SIGNUP",
                textColor: AppColors.kWhiteColor,
                radius: AppCommonSize.s8,
                textPadding: AppCommonSize.s40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
