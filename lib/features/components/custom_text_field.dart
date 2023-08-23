import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unsplash_gallery/core/constants/app_colors.dart';
import 'package:unsplash_gallery/core/constants/app_images.dart';
import 'package:unsplash_gallery/core/constants/app_size.dart';
import 'package:unsplash_gallery/features/components/custom_svg.dart';
import 'package:unsplash_gallery/features/components/my_tooltip.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final String? title;
  final Color? titleColor;
  final String? suffixText;
  final TextEditingController? controller;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onPress;
  final Function(String)? onChanged;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
  final Function? validation;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? prefixIconSize;
  final List<TextInputFormatter>? inputFormatter;
  final double? errorTextHeight;
  final double? hintTextSize;
  final bool isSecure;
  final bool isPassword;
  final bool tooltip;
  final int? maxLine;
  final int? maxLen;
  final double? height;
  final double? weight;
  final double? radius;
  final TextAlign? textAlign;
  final Function(String)? onSaved;
  final bool? isEmail;
  final TextStyle? titleStyle;
  final TextInputAction? textInputAction;
  final Widget? counterWidget;

  CustomTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.inputFormatter,
      this.suffixIcon,
      this.prefixIcon,
      this.onPress,
      this.isSecure = false,
      this.isPassword = false,
      this.errorText,
      this.prefixIconColor,
      this.suffixIconColor,
      this.fillColor,
      this.hintColor,
      this.onSaved,
      this.keyboardType,
      this.isEmail,
      this.validation,
      this.prefixIconSize,
      this.onChanged,
      this.errorTextHeight,
      this.textColor,
      this.hintTextSize,
      this.height,
      this.weight,
      this.textInputAction = TextInputAction.next,
      this.radius,
      this.title,
      this.titleColor,
      this.suffixText,
      this.textAlign,
      this.maxLine = 1,
      this.titleStyle,
      this.maxLen,
      this.counterWidget,
      this.borderColor,
      this.tooltip = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isVisible;
  late InputDecoration inputDecoration;

  @override
  void initState() {
    isVisible = widget.isSecure;
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title ?? "",
              style: widget.titleStyle ??
                  kRegularLine20.copyWith(
                      fontWeight: FontWeight.w500,
                      color: widget.titleColor ?? Colors.grey),
            ),
            5.horizontalSpace,
            Visibility(
              visible: widget.tooltip,
              child: Container(
                alignment: Alignment.centerLeft,
                key: MyTooltip.key,
                width: 200.w,
                child: InkWell(
                    onTap: () {
                      setState(() {});
                      /*WidgetsBinding.instance.addPostFrameCallback(
                          (_) => MyTooltip.showOverlay(true));*/
                      MyTooltip.showOverlay(true);
                      //context.read<AuthCubit>().isTooltipOpen = true;
                    },
                    child: Icon(
                      Icons.info,
                      size: 13.r,
                      color: Colors.white,
                    )),
              ),
            )
          ],
        ),
        widget.title != null ? kHeightBox10 : 0.verticalSpace,
        TextFormField(
          textAlign: widget.textAlign ?? TextAlign.start,
          maxLines: widget.maxLine ?? 1,
          cursorColor: AppColors.kBlackColor,
          maxLength: widget.maxLen ?? null,
          obscureText: widget.isPassword ? !isVisible : false,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatter,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          style: kRegularLine16.copyWith(color: widget.textColor),
          obscuringCharacter: "●",
          decoration: InputDecoration(
              counter: widget.counterWidget ?? SizedBox(),
              contentPadding: EdgeInsets.only(
                  top: widget.height ?? AppHeight.s15,
                  bottom: widget.height ?? AppHeight.s15,
                  left: widget.weight ?? AppWeight.s10,
                  right: AppWeight.s5),
              isDense: true,
              prefixIconConstraints: BoxConstraints.tightFor(width: 35.w),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Icon(
                      widget.prefixIcon,
                      color: widget.prefixIconColor ?? Colors.grey,
                    ),
              suffixIcon: widget.isPassword
                  ? Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: InkWell(
                        onTap: _toggleVisibility,
                        child: CustomSvg(
                          icon: isVisible
                              ? AppImages.iconVisibilityOff
                              : AppImages.iconVisibility,
                          color: AppColors.kDarkGrayColor3,
                          size: AppCommonSize.s20,
                        ),
                      ),
                    )
                  : widget.suffixText == null
                      ? null
                      : SizedBox(
                          width: 20.w,
                          child: InkWell(
                            onTap: widget.onPress,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  widget.suffixText!,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: kRegularLine12.copyWith(
                                      color: widget.suffixIconColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.red, width: 1.0),
                borderRadius:
                    BorderRadius.circular(widget.radius ?? AppCommonSize.s10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.black12, width: 1.0),
                borderRadius:
                    BorderRadius.circular(widget.radius ?? AppCommonSize.s10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.white, width: 1.0),
                borderRadius:
                    BorderRadius.circular(widget.radius ?? AppCommonSize.s10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.black12, width: 1.0),
                borderRadius:
                    BorderRadius.circular(widget.radius ?? AppCommonSize.s10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderColor ?? Colors.red, width: 1.0),
                borderRadius:
                    BorderRadius.circular(widget.radius ?? AppCommonSize.s10),
              ),
              filled: true,
              errorStyle: const TextStyle(height: 0),
              hintStyle: TextStyle(
                fontSize: widget.hintTextSize ?? AppTextSize.s16,
                color: widget.hintColor ?? Colors.white.withOpacity(0.4),
                fontWeight: FontWeight.w400,
              ),
              hintText: widget.hint,
              errorText: widget.errorText,
              fillColor: widget.fillColor ?? Colors.white),
          validator: widget.validation as String? Function(String?)?,
          onSaved: widget.onSaved as String? Function(String?)?,
        ),
      ],
    );
  }
}
