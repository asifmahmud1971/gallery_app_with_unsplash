import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTooltip extends StatelessWidget {
  final Widget? child;
  final String? message;
  final Color? iconColor;
  final double? iconSize;

  const CustomTooltip(
      {Key? key,
      @required this.message,
      @required this.child,
      this.iconColor,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      message: message,
      margin: EdgeInsets.only(left: 50.w, right: 15.w),
      padding: EdgeInsets.all(10.w),
      preferBelow: true,
      verticalOffset: -8.w,
      textStyle:
          const TextStyle(color: Color(0xFF787878), fontFamily: "Poppins"),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.amber)),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _onTap(key),
        child: Row(
          children: [
            SizedBox(child: child),
            Icon(
              Icons.info,
              color: iconColor ?? Colors.white,
              size: iconSize ?? 15.w,
            )
          ],
        ),
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}
