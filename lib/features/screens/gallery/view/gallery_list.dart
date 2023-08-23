import 'package:flutter/material.dart';
import 'package:unsplash_gallery/features/components/custom_empty_body.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:unsplash_gallery/features/components/custom_refresh/refresher.dart';
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart';
import 'package:unsplash_gallery/features/screens/gallery/widgets/image_view_widget.dart';
import 'package:unsplash_gallery/features/screens/gallery/widgets/termin_card_widget.dart';

class GalleryList extends StatelessWidget {
  final GalleryState state;
  final RefreshController controller;
  final VoidCallback onRefresh;
  final VoidCallback? onLoading;
  final bool isToday;

  const GalleryList({
    super.key,
    required this.onRefresh,
    this.onLoading,
    required this.state,
    required this.controller,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return customRefresher(
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: state.allPhotos?.length == 0 &&
          state.status != GalleryStatus.loading
          ? CustomEmptyBody().getEmptyBody(type: EmptyType.gallery)
          : GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => GalleryCardWidget(
          galleryModel: state.allPhotos?[index],
                isToday: isToday,
                onView: () async {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (builder) {
                      return ImageViewWidget(
                        imageUrl: state.allPhotos?[index].urls?.raw,
                        fullImage: state.allPhotos?[index].urls?.full,
                      );
                    },
                  );
                },
                onEdit: () {
            /* GetContext.to(GalleryeEditPage(
                        apiCall: true,
                        id: state.galleryList?.data?[index].id.toString()));*/
          },
        ),
        itemCount: state.allPhotos?.length ?? 0,
      ),
    );
  }
}
