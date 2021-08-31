import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../common/common_public.dart';
import '../cubit/theme/theme_cubit.dart';

class App extends StatelessWidget {
  ThemeCubit themeCubit = ThemeCubit(isLight: true);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => themeCubit,
        ),
      ],
      child: BlocBuilder(
        bloc: themeCubit,
        builder: (context, state) {
          print('BlocListener : ${themeCubit.isLight}');
          return ScreenUtilInit(
            designSize: const Size(1440, 960),
            builder: () => GetMaterialApp(
              title: 'Flutter Base Project',
              debugShowCheckedModeBanner: false,
              enableLog: false,
              navigatorKey: Get.key,
              theme: themeCubit.appTheme.theme,
              initialRoute: _initMainScreen(),
              getPages: routes,
            ),
          );
        },
      ),
    );
  }

  String _initMainScreen() {
    return Routes.dashboard;
  }
}
