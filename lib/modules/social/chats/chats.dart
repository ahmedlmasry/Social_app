import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/cubit/cubit.dart';
import 'package:groub/layout/social%20app/cubit/states.dart';

import 'package:groub/models/social%20app/social_user_model.dart';
import 'package:groub/modules/social/chat%20detailes/chat_detailes.dart';

import 'package:groub/shared/components/components.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.users.length > 0,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildChatItem(cubit.users[index], context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: cubit.users.length),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }

  Widget buildChatItem(SocialUserModel model, context) => InkWell(
        onTap: () {
          navigateTo(
              context,
              ChatDetailesScreen(
                userModel: model,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('${model.image}'),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              '${model.name}',
              style: TextStyle(height: 1),
            ),
          ]),
        ),
      );
}
