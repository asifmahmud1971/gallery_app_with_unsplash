import 'package:flutter/material.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_print.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_appbar.dart';
import 'package:unsplash_gallery/features/components/custom_button.dart';
import 'package:unsplash_gallery/features/components/custom_text_field.dart';
import 'package:unsplash_gallery/features/router/routes.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPress: () => Navigator.of(context).pop(),
        title: "Login",
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(Routes.signupView),
            icon: Icon(
              Icons.person_rounded,
              color: AppColors.kWhiteColor,
            ),
          )
        ],
      ),
      body: SizedBox(
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
                hint: "Enter your Email",
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
                title: "LOGIN",
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
