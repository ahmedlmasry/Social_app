//import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/cubit/cubit.dart';
import 'package:groub/layout/social%20app/cubit/states.dart';
import 'package:groub/models/social%20app/message_model.dart';
import 'package:groub/models/social%20app/social_user_model.dart';
import 'package:groub/shared/styles/colors.dart';

class ChatDetailesScreen extends StatelessWidget {
  SocialUserModel? userModel;
  ChatDetailesScreen({this.userModel});
  var messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SocialCubit.get(context).getMessage(receiverId: userModel!.uId!);
      return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SocialCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(userModel!.image!),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(userModel!.name!)
                  ],
                ),
              ),
              body:

                  //  ConditionalBuilder(
                  //     condition: cubit.messages.length > 0,
                  //     builder: (context) => Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Column(
                  //             children: [
                  //               Expanded(
                  //                 child: ListView.separated(
                  //                     itemBuilder: (context, index) {
                  //                       var message = cubit.messages[index];
                  //                       if (cubit.userModel!.uId ==
                  //                           message.senderId)
                  //                         return buildMyMessage(message);
                  //                       return buildMessage(message);
                  //                     },
                  //                     separatorBuilder: (context, index) =>
                  //                         SizedBox(
                  //                           height: 15,
                  //                         ),
                  //                     itemCount: cubit.messages.length),
                  //               ),
                  //               Container(
                  //                 clipBehavior: Clip.antiAliasWithSaveLayer,
                  //                 decoration: BoxDecoration(
                  //                     border: Border.all(
                  //                         width: 1, color: Colors.grey),
                  //                     borderRadius: BorderRadius.circular(15)),
                  //                 child: Row(
                  //                   children: [
                  //                     Expanded(
                  //                       child: TextFormField(
                  //                         controller: TextEditingController(),
                  //                         decoration: InputDecoration(
                  //                             border: InputBorder.none,
                  //                             hintText: 'type your message here'),
                  //                       ),
                  //                     ),
                  //                     Container(
                  //                       height: 50,
                  //                       color: defaultcolor,
                  //                       child: MaterialButton(
                  //                         onPressed: () {
                  //                           SocialCubit.get(context).sendMessage(
                  //                               receiverId: userModel!.uId!,
                  //                               text:
                  //                                   TextEditingController().text,
                  //                               dateTime:
                  //                                   DateTime.now().toString());
                  //                         },
                  //                         minWidth: 1,
                  //                         child: Icon(
                  //                           Icons.send,
                  //                           color: Colors.white,
                  //                         ),
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //     fallback: (context) =>
                  //         Center(child: CircularProgressIndicator()))
                  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            var message = cubit.messages[index];
                            if (cubit.userModel!.uId == message.senderId)
                              return buildMyMessage(message);
                            return buildMessage(message);
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15),
                          itemCount: cubit.messages.length),
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: messagecontroller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'type your message here'),
                            ),
                          ),
                          Container(
                            height: 50,
                            color: defaultcolor,
                            child: MaterialButton(
                              onPressed: () {
                                SocialCubit.get(context).sendMessage(
                                    receiverId: userModel!.uId!,
                                    text: messagecontroller.text,
                                    dateTime: DateTime.now().toString());
                              },
                              minWidth: 1,
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    });
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10),
                topStart: Radius.circular(10),
                topEnd: Radius.circular(10)),
            color: Colors.grey,
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(model.text!),
        ),
      );

  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10),
                topStart: Radius.circular(10),
                topEnd: Radius.circular(10)),
            color: defaultcolor.withOpacity(.2),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(model.text!),
        ),
      );
}
