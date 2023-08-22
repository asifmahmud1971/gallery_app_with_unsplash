import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/features/screens/termine/widgets/expanded_header.dart';

class ExpandedView extends StatefulWidget {
  final Widget header;
  final Widget body;
  final String? title;
  const ExpandedView({
    Key? key,
    required this.header,
    required this.body,
    this.title,
  }) : super(key: key);

  @override
  _ExpandedViewState createState() {
    return _ExpandedViewState();
  }
}

class _ExpandedViewState extends State<ExpandedView> {
  late ExpandedTileController _controller;

  @override
  void initState() {
    _controller = ExpandedTileController(isExpanded: false);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppCommonSize.s6),
        ),
        border: Border.all(color: AppColors.kGrayColorThree, width: 1),
      ),
      child: ExpandedTile(
        controller: _controller,
        contentseparator: 0,
        theme: ExpandedTileThemeData(
          headerColor: Colors.transparent,
          contentBackgroundColor: Colors.transparent,
          leadingPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          trailingPadding: EdgeInsets.zero,
          headerRadius: AppCommonSize.s6,
          contentRadius: AppCommonSize.s6,
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.zero,
        ),
        trailing: const SizedBox(),
        title: ExpandedHeader(
          isExpanded: _controller.isExpanded,
          title: widget.title,
        ),
        content: SizedBox(height: AppHeight.s120, child: widget.body),
        onTap: () {
          setState(() {});
        },
      ),
    );
  }
}
