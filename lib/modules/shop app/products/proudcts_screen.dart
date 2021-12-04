//import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/shop_app/cubit/cubit.dart';
import 'package:groub/layout/shop_app/cubit/states.dart';
import 'package:groub/models/shop_app/cateogries_model.dart';
import 'package:groub/models/shop_app/home_model.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(listener: (context, state) {
      if (state is ShopSuccessChangeFavoritesState) {
        if (!state.model.status!) {
          showToast(text: state.model.message!, states: Toaststates.ERROR);
        }
      }
    }, builder: (context, state) {
      var cubit = ShopCubit.get(context);
      return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoriesModel != null,
          builder: (context) => productsBuilder(
              cubit.homeModel!, cubit.categoriesModel!, context),
          fallback: (context) => Center(child: CircularProgressIndicator()));

      // productsBuilder(cubit.homeModel!);
    });
  }

  Widget productsBuilder(
          HomeModel model, CategoriesModel cateogriesModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
                items: model.data!.banners
                    .map(
                      (e) => Image(
                          image: NetworkImage('${e.image}'),
                          width: double.infinity,
                          fit: BoxFit.cover),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 250,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cateogries',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  Container(
                      height: 100,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => buildCateogryItem(
                          cateogriesModel.data!.data[index],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                        itemCount: cateogriesModel.data!.data.length,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1 / 1.38,
                  children: List.generate(
                      model.data!.products.length,
                      (index) => buildGridProudcut(
                          model.data!.products[index], context))),
            ),
          ],
        ),
      );
  Widget buildCateogryItem(DataModel model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model.image!),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black38,
            width: 100,
            child: Text(
              model.name!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );

  Widget buildGridProudcut(ProductModel? model, context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model!.image!),
                  width: double.infinity,
                  height: 200,
                ),
                if (model.discount != 0)
                  Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'discount',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, height: 1.3),
                  ),
                  Row(children: [
                    Text(
                      '${model.price.round()}',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.3,
                        color: defaultcolor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (model.discount != 0)
                      Text(
                        '${model.oldPrice.round()}',
                        style: TextStyle(
                            fontSize: 10,
                            height: 1.3,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        ShopCubit.get(context).changeFavorites(model.id!);
                        print(model.id);
                      },
                      icon: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              ShopCubit.get(context).favorites[model.id]!
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
      );
}
