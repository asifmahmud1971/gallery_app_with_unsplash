import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.kPrimaryColor),
            accountName: const Text(
              'Guest',
            ),
            accountEmail: const Text(
              'hmbadhon@gmail.com',
            ),
            currentAccountPicture: Image.asset(AppImages.logo),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.home,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Home',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.person,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Profile',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.description,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Orders',
            ),
          ),
          // ListTile(
          //   onTap: () {
          //     Navigator.pop(context);
          //     if (LocalizationHelper().getCurrentLanguage() == 'Bangla') {
          //       LocalizationHelper().changeLocale('English');
          //     } else {
          //       LocalizationHelper().changeLocale('Bangla');
          //     }
          //   },
          //   leading: const Icon(
          //     Icons.language,
          //     color: kPrimaryColor,
          //   ),
          //   title: Text(
          //     LocalizationHelper().getCurrentLanguage() == 'Bangla'
          //         ? 'Bangla'
          //         : 'English',
          //   ),
          // ),
          // GetBuilder<ThemeController>(
          //   builder: (themeController) {
          //     return ListTile(
          //       onTap: () async {
          //         Navigator.pop(context);
          //         Get.find<ThemeController>().toggleTheme();
          //       },
          //       leading: Icon(
          //         themeController.darkTheme
          //             ? Icons.light_mode
          //             : Icons.dark_mode,
          //         color: kPrimaryColor,
          //       ),
          //       title: const Text(
          //         'Change Theme',
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            onTap: () async {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.phone,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Customer Support',
            ),
          ),
          ListTile(
            onTap: () async {},
            leading: const Icon(
              Icons.rate_review,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Rate Us',
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.share,
              color: AppColors.kPrimaryColor,
            ),
            title: const Text(
              'Share App',
            ),
          ),
        ],
      ),
    );
  }
}
