import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/components/custom_appbar.dart';
import 'package:unsplash_gallery/features/components/custom_dialogs.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:unsplash_gallery/features/router/routes.dart';
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart';
import 'package:unsplash_gallery/features/screens/gallery/view/gallery_list.dart';

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
    ).show().then(
          (value) => value as bool,
        );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _onBackPressed();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppStrings.gallery.tr(),
          onPress: () {
            Navigator.pop(context);
            getData();
          },
        ),
        body: BlocConsumer<GalleryCubit, GalleryState>(
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
          builder: (context, state) {
            return GalleryList(
              controller: context.read<GalleryCubit>().homeController,
              state: state,
              onRefresh: () {
                getData();
              },
              onLoading: state.hasReachedMax ? null : getData,
            );
          },
        ),
      ),
    );
  }
}
