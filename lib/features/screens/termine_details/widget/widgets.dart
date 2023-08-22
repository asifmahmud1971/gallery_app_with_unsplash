import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terminator/core/constants/app_colors.dart';
import 'package:terminator/core/constants/app_images.dart';
import 'package:terminator/core/constants/app_size.dart';
import 'package:terminator/core/constants/app_strings.dart';
import 'package:terminator/features/components/custom_svg.dart';
import 'package:terminator/features/components/custom_text_field.dart';
import 'package:terminator/features/components/my_context.dart';
import 'package:terminator/features/screens/termine_details/cubit/termin_details_cubit.dart';
import 'package:terminator/features/screens/termine_details/model/appointment_model.dart';

resultDropdown(
    {title,
    ResultModel? value,
    bool? enable = true,
    String? hint,
    List<ResultModel>? list,
    Function(ResultModel?)? onChanged}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Text(
        title,
        style: kRegularLine14.copyWith(
            fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
      )),
      Expanded(
          child: DropdownSearch<ResultModel>(
        selectedItem: ResultModel(
            value: value?.value ?? AppStrings.selectResult.tr(),
            label: value?.label ?? AppStrings.selectResult.tr()),
        itemAsString: (ResultModel u) => u.label.toString(),
        items: GetContext.context.read<TerminDetailsCubit>().resultList,
        onChanged: onChanged,
        dropdownButtonProps: DropdownButtonProps(
          icon: CustomSvg(
            icon: AppImages.downArrow,
            size: 6.r,
          ),
        ),
        popupProps: PopupProps.menu(
          menuProps: MenuProps(borderRadius: BorderRadius.circular(10)),
          fit: FlexFit.loose,
          constraints: BoxConstraints(
            maxHeight: 300.h,
            minHeight: 150.h,
          ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: kRegularLine14.copyWith(
              overflow: TextOverflow.ellipsis,
              color: AppColors.kAshColorOne,
              fontWeight:
                  value?.value != null ? FontWeight.w700 : FontWeight.w400),
          dropdownSearchDecoration: dropdownDecoration(hint: hint),
        ),
      )),
    ],
  );
}

explanationDropdown(
    {title,
    Appointment? value,
    bool? enable = true,
    String? hint,
    List<Appointment>? list,
    Function(Appointment?)? onChanged}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: Text(
        title,
        style: kRegularLine14.copyWith(
            fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
      )),
      Expanded(
          child: DropdownSearch<Appointment>(
        itemAsString: (Appointment u) => u.label.toString(),
        items: list!,
        selectedItem: Appointment(
            label: value?.label ?? "Please Select",
            value: value?.value ?? "Please Select"),
        onChanged: onChanged,
        dropdownButtonProps: DropdownButtonProps(
          icon: CustomSvg(
            icon: AppImages.downArrow,
            size: 6.r,
          ),
        ),
        popupProps: PopupProps.menu(
          menuProps: MenuProps(borderRadius: BorderRadius.circular(10)),
          fit: FlexFit.loose,
          constraints: BoxConstraints(
            maxHeight: 300.h,
            minHeight: 150.h,
          ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: kRegularLine14.copyWith(
              overflow: TextOverflow.ellipsis,
              color: AppColors.kAshColorOne,
              fontWeight:
                  value?.label != null ? FontWeight.w700 : FontWeight.w500),
          dropdownSearchDecoration: dropdownDecoration(hint: hint),
        ),
      ))
    ],
  );
}

itemCard(value) {
  return Text(value);
}

InputDecoration dropdownDecoration({hint}) {
  return InputDecoration(
    isDense: true,
    hintText: hint ?? "Please Select",
    hintStyle: kRegularLine16.copyWith(color: AppColors.kAshColorThree),
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1.0),
      borderRadius: BorderRadius.circular(AppCommonSize.s10),
    ),
    border: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1.0, style: BorderStyle.solid, color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1.0),
      borderRadius: BorderRadius.circular(AppCommonSize.s10),
    ),
  );
}

textCardWithCheckBox({value, bool? enable = true, VoidCallback? onTap}) {
  return Padding(
    padding: REdgeInsets.only(right: 10.0),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Icon(
            enable! ? Icons.radio_button_on : Icons.radio_button_off,
            size: 18.r,
            color: AppColors.kPurpleColorFour,
          ),
        ),
        5.horizontalSpace,
        Text(
          value,
          style: kRegularLine13.copyWith(
              fontWeight: FontWeight.w400, color: AppColors.kAshColorOne),
        ),
      ],
    ),
  );
}

textCard({title, value}) {
  return Row(
    children: [
      Expanded(
          child: Text(
        title,
        style: kRegularLine14.copyWith(
            fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
      )),
      Expanded(
          child: Text(
        value,
        style: kRegularLine13.copyWith(
            fontWeight: FontWeight.w400, color: AppColors.kAshColorOne),
      )),
    ],
  );
}

textFieldCard(
    {title,
    value,
    hint,
    maxLine,
    TextEditingController? controller,
    List<TextInputFormatter>? inputFormatter,
    TextInputType? textInputType}) {
  return Row(
    children: [
      Expanded(
          child: Text(
        title,
        style: kRegularLine14.copyWith(
            fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
      )),
      Expanded(
          child: CustomTextField(
        maxLine: maxLine,
        inputFormatter: inputFormatter,
        keyboardType: textInputType,
        controller: controller,
        maxLen: 250,
        borderColor: AppColors.kGrayColorThree,
        fillColor: Colors.transparent,
        hintTextSize: 14.sp,
        hint: hint ?? "",
        hintColor: AppColors.kAshColorThree,
      )),
    ],
  );
}

textYearCard({title, value, hint, VoidCallback? onTap, selectedYear}) {
  return Row(
    children: [
      Expanded(
          child: Padding(
        padding: REdgeInsets.only(right: 10),
        child: Text(
          title,
          style: kRegularLine14.copyWith(
              fontWeight: FontWeight.w700, color: AppColors.kAshColorOne),
        ),
      )),
      Expanded(
          child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.kGrayColorThree)),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(selectedYear,
                    style: kRegularLine14.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.kAshColorOne)),
              )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.kAshColorThree,
                ),
              )
            ],
          ),
        ),
      )),
    ],
  );
}
