import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminator/features/screens/termine/cubit/termin_cubit.dart';

import '../../features/screens/auth/cubit/auth_cubit.dart';
import '../../features/screens/dashboard/cubit/dashboard_cubit.dart';
import '../../features/screens/no_internet/cubit/internet_cubit.dart';
import '../../features/screens/termine_details/cubit/termin_details_cubit.dart';
import '../../features/screens/theme/cubit/theme_cubit.dart';
import 'app_dependency.dart';

class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    BlocProvider<InternetCubit>(
        create: (BuildContext context) => instance<InternetCubit>()),
    BlocProvider<DashboardCubit>(
        create: (BuildContext context) => instance<DashboardCubit>()),
    BlocProvider<TerminCubit>(
        create: (BuildContext context) => instance<TerminCubit>()),
    BlocProvider<AuthCubit>(
        create: (BuildContext context) => instance<AuthCubit>()),
    BlocProvider<TerminDetailsCubit>(
        create: (BuildContext context) => instance<TerminDetailsCubit>()),
  ];
}
