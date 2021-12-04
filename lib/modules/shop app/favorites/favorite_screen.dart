import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/shop_app/cubit/cubit.dart';
import 'package:groub/layout/shop_app/cubit/states.dart';
import 'package:groub/models/shop_app/favorite_model.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);

          return ListView.separated(
              itemBuilder: (context, index) => buildFavItem(
                  cubit.favoritesModel!.data!.data[index], context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: cubit.favoritesModel!.data!.data.length);

          // return ConditionalBuilder(
          //   condition: state is! ShopLoadingGetFavoritesState,
          //   builder: (context) => ListView.separated(
          //       itemBuilder: (context, index) => buildFavItem(
          //           cubit.favoritesModel!.data!.data[index], context),
          //       separatorBuilder: (context, index) => myDivider(),
          //       itemCount: cubit.favoritesModel!.data!.data.length),
          //   fallback: (BuildContext context) =>
          //       Center(child: CircularProgressIndicator()),
          // );
        });
  }

  Widget buildFavItem(
    FavoritesData model,
    context,
  ) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 200,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.product!.image!),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  if (model.product!.discount != 0)
                    Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'discount',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.product!.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 2),
                    ),
                    Spacer(),
                    Row(children: [
                      Text(
                        model.product!.price.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.3,
                          color: defaultcolor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.product!.discount != 0)
                        Text(
                          model.product!.oldPrice,
                          style: TextStyle(
                              fontSize: 10,
                              height: 1.3,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context)
                              .changeFavorites(model.product!.id!);
                        },
                        icon: CircleAvatar(
                            radius: 15,
                            backgroundColor: ShopCubit.get(context)
                                    .favorites[model.product!.id]!
                                ? defaultcolor
                                : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
