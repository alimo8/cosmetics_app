import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/networking/dio_helper.dart';
import 'package:cosmetics/views/home/cubit/category_cubit.dart';
import 'package:cosmetics/views/home/cubit/Product_cubit.dart';
import 'package:cosmetics/views/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ProductCubit()),
              BlocProvider(create: (context) => CategoryCubit()),
            ],
            child: MaterialApp(
              theme: ThemeData(
                fontFamily: 'Montserrat',
                scaffoldBackgroundColor: Color(0xffD9D9D9),
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffD75D72)),
                appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                  iconTheme: IconThemeData(color: Color(0xff434C6D)),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  errorBorder: buildBorder,
                  focusedErrorBorder: buildBorder,
                ),
              ),
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              home: HomeView(),
            ),
          );
        },
      ),
    );
  }
}

OutlineInputBorder get buildBorder {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.red, width: 1),
  );
}
