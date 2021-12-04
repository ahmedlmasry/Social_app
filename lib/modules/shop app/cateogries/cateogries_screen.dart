import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/shop_app/cubit/cubit.dart';
import 'package:groub/layout/shop_app/cubit/states.dart';
import 'package:groub/models/shop_app/cateogries_model.dart';
import 'package:groub/shared/components/components.dart';

class CateogriesScreen extends StatelessWidget {
  const CateogriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ListView.separated(
            itemBuilder: (context, index) =>
                builCatItem(cubit.categoriesModel!.data!.data[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: cubit.categoriesModel!.data!.data.length);
      },
    );
  }

  Widget builCatItem(DataModel model) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Image(
              image: NetworkImage(model.image!),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              model.name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
          ],
        ),
      );
}
