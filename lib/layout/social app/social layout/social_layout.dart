import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/cubit/cubit.dart';
import 'package:groub/layout/social%20app/cubit/states.dart';
import 'package:groub/modules/social/new%20post/new_post.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentindex]),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(IconBroken.Notification)),
              IconButton(onPressed: () {}, icon: Icon(IconBroken.Search))
            ],
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Add_User), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Profile), label: 'user'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: 'settings')
            ],
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
          ),
        );
      },
    );
  }
}
