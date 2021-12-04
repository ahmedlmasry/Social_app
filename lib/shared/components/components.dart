//import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:groub/layout/shop_app/cubit/cubit.dart';
import 'package:groub/layout/todo_app/cubit/cubit.dart';
import 'package:groub/modules/news%20app/web%20view/web_view.dart';
import 'package:groub/modules/todo%20app/archived_tasks/archived_tasks.dart';
//import 'package:groub/modules/web%20view/web_view.dart';
//import 'package:flutter/semantics.dart';
import 'package:groub/shared/styles/colors.dart';
//import 'package:webview_flutter/webview_flutter.dart';

Widget defaultButton(
        {double width = double.infinity,
        Color background = Colors.blue,
        bool isUpperCase = true,
        required Function function,
        required String text}) =>
    Container(
      width: width,
      height: 40,
      color: background,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defalutFormfeild({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmited,
  Function()? ontap,
  Function? onChanged,
  required FormFieldValidator valdiate,
  required String label,
  required IconData prefix,
  bool ispassword = false,
  IconData? suffix,
  Function? suffixpressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      onFieldSubmitted: (s) {
        onSubmited!(s);
      },
      onChanged: (value) {
        onChanged!(value);
      },
      onTap: () {
        ontap!();
      },
      validator: (s) {
        valdiate(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixpressed!();
                },
                icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget buildtaskitem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('${model['time']}'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'done', id: model['id']);
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'archived', id: model['id']);
                },
                icon: Icon(Icons.archive, color: Colors.grey))
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );
Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) {
          return buildtaskitem(tasks[index], context);
        },
        separatorBuilder: (context, index) => myDivider(),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget buildArticleItem(
  article,
  context,
) =>
    InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
Widget articleBuilder(list, context, {isSearsh = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 10),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
        onPressed: () {
          function();
        },
        child: Text(text.toUpperCase()));

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
void showToast({required String text, required Toaststates states}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(states),
        textColor: Colors.white,
        fontSize: 16.0);

enum Toaststates { SUCESS, ERROR, WARNING }
Color chooseToastColor(Toaststates states) {
  Color color;
  switch (states) {
    case Toaststates.SUCESS:
      color = Colors.green;
      break;
    case Toaststates.ERROR:
      color = Colors.red;
      break;
    case Toaststates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: defaultcolor,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(model.id);
                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                              ShopCubit.get(context).favorites[model.id]!
                                  ? defaultcolor
                                  : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
