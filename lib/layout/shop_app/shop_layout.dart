import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/shop_app/cubit/cubit.dart';
import 'package:groub/layout/shop_app/cubit/states.dart';
import 'package:groub/modules/shop%20app/searsh/searsh_screen.dart';
import 'package:groub/shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Salla'),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            body: cubit.bottomScreens[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.changeBottom(index);
                },
                currentIndex: cubit.currentindex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.apps), label: 'cateogries'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'settings')
                ]),
          );
        });
  }
}
