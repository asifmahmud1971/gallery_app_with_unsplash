import 'package:flutter/material.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/features/components/custom_empty_body.dart';
import 'package:terminator/features/components/custom_refresh/pull_to_refresh.dart';
import 'package:terminator/features/components/custom_refresh/refresher.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';
import 'package:terminator/features/screens/termine/widgets/termin_card_widget.dart';
import 'package:terminator/features/screens/termine_details/view/termin_edit_page.dart';
import 'package:terminator/features/screens/termine_details/view/termine_details_page.dart';

import '../../termine/widgets/image_view_widget.dart';

class TerminList extends StatelessWidget {
  final TerminState state;
  final RefreshController controller;
  final VoidCallback onRefresh;
  final VoidCallback? onLoading;
  final bool isToday;

  const TerminList({
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
      child: state.allPhotos!.isEmpty &&
              state.status != TerminStatus.loading
          ? CustomEmptyBody().getEmptyBody(type: EmptyType.termine)
          :

      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) => TerminCardWidget(
          galleryModel: state.allPhotos?[index],
          isToday: isToday,
          onView: () {

              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (builder) {
                  return ImageViewWidget(
                      imageUrl: state.allPhotos?[index].urls?.raw);
                },
              );

          },
          onEdit: () {
            /* GetContext.to(TermineEditPage(
                        apiCall: true,
                        id: state.terminList?.data?[index].id.toString()));*/
          },
        ),
        itemCount: state.allPhotos?.length??0,
      ),
    );
  }
}
