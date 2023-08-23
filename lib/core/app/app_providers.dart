import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/features/screens/gallery/cubit/gallery_cubit.dart';
import '../../features/screens/no_internet/cubit/internet_cubit.dart';
import '../../features/screens/theme/cubit/theme_cubit.dart';
import 'app_dependency.dart';

class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    BlocProvider<InternetCubit>(
        create: (BuildContext context) => instance<InternetCubit>()),
    BlocProvider<GalleryCubit>(
        create: (BuildContext context) => instance<GalleryCubit>()),
  ];
}
