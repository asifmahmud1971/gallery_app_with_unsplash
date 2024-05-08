import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/components/custom_appbar.dart';
import 'package:unsplash_gallery/features/components/custom_dialogs.dart';
import 'package:unsplash_gallery/features/components/custom_drawer.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:unsplash_gallery/features/router/routes.dart';
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart';
import 'package:unsplash_gallery/features/screens/gallery/view/gallery_list.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_size.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Timer? _debounce;

  @override
  void initState() {
    context.read<GalleryCubit>().homeController =
        RefreshController(initialRefresh: false);
    getData();
    super.initState();
  }

  void getData() {
    context.read<GalleryCubit>().getGalleryData();
  }

  Future<bool> _onBackPressed() async {
    return CustomDialog.showCustomDialog2(
      context: context,
      title: AppStrings.appExitTitle.tr(),
      details: AppStrings.appExitTitleDesc.tr(),
      onYes: () => SystemNavigator.pop(),
    ).show().then((value) => value as bool);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GalleryCubit, GalleryState>(
      builder: (context, state) {
        return PopScope(
          onPopInvoked: (bool didPop) => _onBackPressed(),
          child: Scaffold(
            drawer: CustomDrawer(),
            appBar: CustomAppBar(
              title: AppStrings.gallery.tr(),
              onPress: () {
                Navigator.pop(context);
                getData();
              },
              actions: [
                Text(
                  "${state.allPhotos?.length ?? "0"}",
                  style: kH3Text.copyWith(
                    fontWeight: semiBoldFont,
                    color: AppColors.kWhiteColorOne,
                  ),
                ),
                kWidthBox5,
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.sliverAppBar);
                  },
                  icon: Icon(
                    Icons.gamepad_outlined,
                    color: AppColors.kWhiteColor,
                  ),
                ),
                kWidthBox5,
              ],
            ),
            body: GalleryList(
              controller: context.read<GalleryCubit>().homeController,
              state: state,
              onRefresh: () {
                getData();
              },
              onLoading: state.hasReachedMax ? null : getData,
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.status == GalleryStatus.unAuthorized) {
          CustomDialog.showUnAuthorisedDialog(
            context: context,
            onYes: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.login, (route) => false);
            },
          );
        }
      },
    );
  }
}
