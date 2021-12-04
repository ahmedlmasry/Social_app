import 'package:bloc/bloc.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/news_app/news_layout/news_layout.dart';
import 'package:groub/layout/shop_app/shop_layout.dart';
import 'package:groub/layout/social%20app/social%20layout/social_layout.dart';
import 'package:groub/layout/todo_app/cubit/cubit.dart';
import 'package:groub/layout/todo_app/cubit/states.dart';
import 'package:groub/layout/todo_app/todo_layout.dart';
import 'package:groub/modules/shop%20app/on%20boarding/on_boarding_screen.dart';
import 'package:groub/modules/shop%20app/shop%20login/shop_login_screen.dart';
import 'package:groub/shared/components/bloc_observer.dart';
import 'package:groub/shared/network/local/cache_helper.dart';
import 'package:groub/shared/network/remote/dio_helper.dart';
import 'package:groub/shared/styles/themes.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/shop_app/cubit/cubit.dart';
import 'layout/social app/cubit/cubit.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('on Background message ');
//   print(message.data.toString());
//   showToast(text: 'on Background message', states: Toaststates.SUCESS);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(Size(650, 650));

  // await Firebase.initializeApp();

  // var token = await FirebaseMessaging.instance.getToken();
  // print(token);
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('on message');
  //   print(event.data.toString());
  //   showToast(text: 'on message', states: Toaststates.SUCESS);
  // });
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('on message opened app');
  //   print(event.data.toString());
  //   showToast(text: 'on message opened app', states: Toaststates.SUCESS);
  // });
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  var token = CacheHelper.getData(key: 'token');

  // uId = CacheHelper.getData(key: 'uId');
  if (onBoarding != null) {
    if (token != null)
      widget = ShopLayout();
    else
      widget = ShopLoginScreen();
  } else {
    widget = OnBoardingScreen();
  }

  // if (uId != null) {
  //   widget = SocialLayout();
  // } else {
  //   widget = SocialLogin();
  // }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp({
    required this.isDark,
    required this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getSceince(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getcategories()
            ..getFavorites(),
        ),
        BlocProvider(
            create: (BuildContext context) => SocialCubit()
              ..getUserData()
              ..getPosts()
            //..getUsers()
            ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
