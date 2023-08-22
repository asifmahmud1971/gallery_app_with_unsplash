import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/screens/termine/widgets/expanded_view.dart';
import 'package:terminator/features/screens/termine_details/widget/termin_expanded_view.dart';

class TerminExpendedDetails extends StatelessWidget {
  final String? title;
  final Widget? child;
  const TerminExpendedDetails({Key? key, this.title, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return TerminExpandedView(
      header: SizedBox(),
      headerTitle: title,
      body: SizedBox(
        child: child,
      ),
    );
  }
}
