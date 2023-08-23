import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/core/constants/app_strings.dart';
import 'package:unsplash_gallery/features/components/custom_appbar.dart';
import 'package:unsplash_gallery/features/components/custom_dialogs.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:unsplash_gallery/features/router/routes.dart';
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart';
import 'package:unsplash_gallery/features/screens/gallery/view/termin_list.dart';

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
    getData(isRefresh: true);
    super.initState();
  }

  void getData(
      {bool isToday = false, bool isRefresh = false, bool isSearch = false}) {
    if (isRefresh) {
      context.read<GalleryCubit>().searchController.clear();
      context.read<GalleryCubit>().sort = SortStatus.desc;
    } else if (isSearch) {}
    context.read<GalleryCubit>().getGalleryData(isToday: isToday);
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 800),
      () => getData(isSearch: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.gallery.tr(),
        onPress: () {
          Navigator.pop(context);
          getData(isRefresh: true, isToday: true);
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
              getData(isRefresh: true);
            },
            onLoading: state.hasReachedMax ? null : getData,
          );
        },
      ),
    );
  }
}
