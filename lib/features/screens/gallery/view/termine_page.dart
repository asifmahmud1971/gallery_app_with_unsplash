import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/components/custom_dialogs.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:unsplash_gallery/features/router/routes.dart';
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart';
import 'package:unsplash_gallery/features/screens/gallery/view/termin_list.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    getData(isRefresh: true);
    super.initState();
  }

  void getData({bool isRefresh = false}) {
    if (isRefresh) {
      context.read<GalleryCubit>().page = 1;
    }
    context.read<GalleryCubit>().getGalleryData(isToday: true);
  }

  @override
  Widget build(BuildContext context) {
    context.read<GalleryCubit>().homeTodayController =
        RefreshController(initialRefresh: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPurpleColorFour,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          AppStrings.appName.tr(),
          style: kRegularLine20.copyWith(
              color: AppColors.kWhiteColor, fontWeight: FontWeight.w700),
        ),
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
            state: state,
            controller: context.read<GalleryCubit>().homeTodayController,
            onRefresh: () {
              getData(isRefresh: true);
            },
            onLoading: state.hasReachedMax
                ? null
                : () {
                    getData();
                  },
          );
        },
      ),
    );
  }
}
