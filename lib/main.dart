import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/cubit/states.dart';
import 'package:groub/layout/social%20app/social%20layout/social_layout.dart';

import 'package:groub/shared/components/bloc_observer.dart';
import 'package:groub/shared/components/constants.dart';
import 'package:groub/shared/network/local/cache_helper.dart';
import 'package:groub/shared/styles/themes.dart';

import 'layout/social app/cubit/cubit.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('on Background message ');
//   print(message.data.toString());
//   showToast(text: 'on Background message', states: Toaststates.SUCESS);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DesktopWindow.setMinWindowSize(Size(650, 650));

  await Firebase.initializeApp();

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

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => SocialCubit()
              ..getUserData()
              ..getPosts()
            //..getUsers()
            ),
      ],
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            // home: ScreenTypeLayout(
            //   mobile: ShopLayout(),
            //   desktop: Text('desktop'),
            home: const SocialLayout(),
          );
        },
      ),
    );
  }
}
