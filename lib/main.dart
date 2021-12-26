import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/shared/network/local/chache_helper.dart';
import 'package:meta_app/layout/social_app/cubit/cubit.dart';
import 'package:meta_app/layout/social_app/social_layout.dart';
import 'package:meta_app/modules/social_app/social_login/social_login_screen.dart';
import 'package:meta_app/shared/bloc_observer.dart';
import 'package:meta_app/shared/components/constants.dart';
import 'package:meta_app/shared/cubit/cubit.dart';
import 'package:meta_app/shared/cubit/states.dart';
import 'package:meta_app/shared/network/local/chache_helper.dart';
import 'package:meta_app/shared/network/remote/dio_helper.dart';
import 'package:meta_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  await CacheHelper.init();

  // CacheHelper.removeData(
  //   key: 'uId',
  // );

  bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');

  uId = CacheHelper.getData(key: 'uId');

  print(token);

  // if (onBoarding != null) {
  //   if (token != null)
  //     widget = ShopLayout();
  //   else
  //     widget = ShopLoginScreen();
  // } else {
  //   widget = OnBoardingScreen();
  // }

  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = SocialLoginScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  // constructor
  // build

  final bool isDark;
  final Widget startWidget;

  const MyApp({
    this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              AppCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (BuildContext context) => SocialCubit()
            ..getUserData()
            ..getPosts(),
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            // themeMode:
            //             //     AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            themeMode: ThemeMode.dark,
            darkTheme: lightTheme,
            home:
                //ShopLayout(),
                //Test(),
                SocialLoginScreen(),
            // startWidget,
          );
        },
      ),
    );
  }
}
