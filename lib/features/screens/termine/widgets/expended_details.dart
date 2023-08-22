import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';
import 'package:terminator/features/screens/termine/model/filter_model.dart';
import 'package:terminator/features/screens/termine/widgets/expanded_view.dart';

class ExpendedDetails extends StatefulWidget {
  final String? title;
  final List<Filter>? filterData;
  final TerminFilterType? filterType;
  const ExpendedDetails({
    Key? key,
    this.title,
    this.filterData,
    this.filterType = TerminFilterType.date,
  }) : super(key: key);

  @override
  State<ExpendedDetails> createState() => _ExpendedDetailsState();
}

class _ExpendedDetailsState extends State<ExpendedDetails> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return ExpandedView(
      header: SizedBox(),
      title: widget.title,
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        interactive: true,
        thickness: AppWeight.s8,
        controller: scrollController,
        radius: Radius.circular(AppCommonSize.s2),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.filterData?.length ?? 0,
          controller: scrollController,
          itemBuilder: (context, index) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: AppColors.kPurpleColorFour,
                onTap: () {
                  context.read<TerminCubit>().setFilter(widget.filterType!,
                      value: widget.filterData?[index]);
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWeight.s15, vertical: AppHeight.s5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSvg(
                        icon: context.read<TerminCubit>().isAlreadyExist(
                                widget.filterData![index], widget.filterType!)
                            ? AppImages.checkedBox
                            : AppImages.uncheckedBox,
                        size: AppCommonSize.s14,
                      ),
                      kWidthBox8,
                      Text(
                        widget.filterData?[index].label ?? '',
                        style: kP2Text.copyWith(
                          fontWeight: regularFont,
                          color: AppColors.kAshColorOne,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return kHeightBox5;
          },
        ),
      ),
    );
  }
}
