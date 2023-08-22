import 'package:flutter/material.dart';

class AppColors {
  static const kWhiteColorOne = Color(0xFFFFFFFF);
  static const kWhiteColorTwo = Color(0xFFF9FAFB);

  static const kBlackColorOne = Color(0xFF000000);
  static const kBlackColorTwo = Color(0xFF939393);

  static const kAshColorOne = Color(0xFF787878);
  static const kAshColorTwo = Color(0xFFDFDFDF);
  static const kAshColorFive = Color(0xFFF9FAFB);
  static const kAshColorThree = Color(0xFF939393);

  static const kGrayColorOne = Color(0xFF5F4C5C);
  static const kGrayColorTwo = Color(0xFF7F707D);
  static const kGrayColorThree = Color(0xFFE6DEE5);

  static const kPurpleColorOne = Color(0xFFC52E62);
  static const kPurpleColorTwo = Color(0xFF92377C);
  static const kPurpleColorThree = Color(0xFF632C92);
  static const kPurpleColorFour = Color(0xFFAB326F);

  static const kBlueColorOne = Color(0xFF107CAD);
  static const kBlueColorTwo = Color(0xFF90BBFF);
  static const kRedColor = Color(0xFFF93232);
  static const kGreenColor = Color(0xFF439F6E);
  static const kYellowColor = Color(0xFFFFC000);

  static const kGradientColorStartOne = Color(0xFFC52E62);
  static const kGradientColorEndOne = Color(0xFF8B387F);

  static RadialGradient backGroundColor = RadialGradient(
    colors: [
      const Color(0xffE48F51).withOpacity(0.27),
      const Color(0xffD9D9D9).withOpacity(0),
      const Color(0xffD9D9D9).withOpacity(0),
      const Color(0xffD9D9D9).withOpacity(0),
    ],
    radius: 4.0,
    center: Alignment.topCenter,
  );

  static LinearGradient appBackgroundColor =
      LinearGradient(begin: Alignment.centerLeft, stops: [
    0,
    1
  ], colors: [
    Color(0xff8B387F).withAlpha(6),
    Color(0xffC52E62),
  ]);

  static LinearGradient tabGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF3F8AA7),
        Color(0xFF75B5CE),
        Color(0xFF67A7C0),
        Color(0xFF5A9EB8)
      ]);

  static const kGradientColorStartTwo = Color(0xFF3F8AA7);
  static const kGradientColorEndTwo = Color(0xFF297C9C);

  ///main them color
  //App primary color
  static const kPrimaryColor =
      Color(0xFF0D8699); //int color: Color(0xFFFF3A27);
  //App secondary color
  static const kSecondaryColor =
      Color(0xFF1B364B); //int color: Color(0xFFFF6D27);
  //Light theme app background color
  static const kBgColor = Color(0xFFF3F3F3);
  static const kPrimaryOne = Color(0xFF2BB8C7);

  //Dark theme app cardColor
  static const kCardDarkColor = Color(0xFF242527);

  // additional cost page color
  static const rejectedColor = Color(0xFFF5365C);
  static const dateColor = Color(0xFF55648A);

//Dark theme app background color
  static const kBgDarkColor = Color(0xFF18191B);
  static const kAppBarColor = kWhiteColor;
  static const kStatusBarColor = kWhiteColor;
  static const kStatusBarIcColor = Colors.black;
  static const kCursorColor = Colors.black;
  static const kDividerColor = Color(0xFFA1A1A1);
  static const kLightBlackColor = Color(0xFF1C1C1C);
  static const kHintColor = Color(0xFFA1A1A1);
  static const kBottomNavigationBgColor = Colors.white;
  static const Color kAccentColor = Color(0xffFCAAAB);

  ///end main them color
//app color
  static const kWhiteColor = Colors.white;
  static const kBlackColor = Colors.black;
  static const kBlackColor2 = Color(0xFF242527);
  static const kPaymentStatus = Color(0xFFFFB700);
  static const kFbColors = Color(0xFF2B87FF); //2B87FF / 0065FF
  static const kDarkGrayColor = Color(0xFF4E4E4E);
  static const kDarkGrayColor2 = Color(0xFF7A7A7A);
  static const kDarkGrayColor3 = Color(0xFFE5E5E5);
  static const kGrayIconColor = Color(0xFFA3A3A3);
  static const kOrdinaryColor = Color(0xFFA1A1A1);
  static const kOrdinaryColor2 = Color(0xFFE5E5E5); //E5E5E5 EFE
  static const kOrdinaryColor3 = Color(0xFFEFEFEF); //E5E5E5 EFE
  static const kBackGroundColor = Color(0xFF2A2C36);
  static const kStUnderLineColor = Color(0xFF808080);
  static const kStUnderLineColor2 = Color(0xFF707070);
  static const kDarkColor = Color(0xFF1B1B1B);
  static const kLiteDarkColor = Color(0xFF232323);
  static const kErrorColor = Color(0xFFFF2424);
  static const kSuccessColor = Color(0xFF2EB843);
  static const kSaleColor = Color(0xFFF14705);
  static const kIconColor = Color(0xFFF9784F);
  static const kSubscriptionColor = Color(0xFFF2C822);
  static const kActiveColor = Color(0xFF06B87A);
  static const kInActiveColor = Color(0xFFE05656);
  static const kBreakColor = Color(0xFFFCA345);
  static const kLoginBg = Color(0xFFEEEEEE);

//Order status
  static const completeColor = Color(0xFF49B81F);
  static const inProgressColor = Color(0xff5e6172);
  static const todoColor = Color(0xffd1d2d7);
  static const kPendingColor = Color(0xFF363636);
  static const kDeliveredColor = Color(0xFF49B81F);

//timeLine
  static const kTimelineColor = Color(0xFFFF9E73);

  static final kOrdinaryShadow = BoxShadow(
    color: kOrdinaryColor.withOpacity(.12),
    spreadRadius: 1,
    blurRadius: 1,
    offset: const Offset(0, 1),
  );
}
