import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/news_app/cubit/cubit.dart';
import 'package:groub/layout/news_app/cubit/states.dart';
import 'package:groub/layout/todo_app/cubit/cubit.dart';
import 'package:groub/modules/news%20app/searsh/searsh_screen.dart';
import 'package:groub/shared/components/components.dart';

//import 'package:groub/shared/network/remote/dio_helper.dart';
//import 'package:groub/layout/news_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'news app',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SearshScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  )),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
        );
      },
    );
  }
}
