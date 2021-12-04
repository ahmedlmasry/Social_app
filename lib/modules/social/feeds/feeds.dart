import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/cubit/cubit.dart';
import 'package:groub/layout/social%20app/cubit/states.dart';
import 'package:groub/models/social%20app/postmodel.dart';

import 'package:groub/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.posts.length > 0,
            builder: (context) => SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(8),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                Image(
                                  image: NetworkImage(
                                      'https://image.freepik.com/free-photo/serious-male-designer-focused-screen-laptop-computer-concentrated-analyzing-information-thinks-about-report-during-distance-job_273609-34350.jpg'),
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'communicate with  frindes',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) =>
                            buildPostItem(cubit.posts[index], context, index),
                        itemCount: cubit.posts.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
            fallback: (context) => Center(child: CircularProgressIndicator()));
      },
    );
  }

  buildPostItem(PostModel model, context, index) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    '${SocialCubit.get(context).userModel!.image}'),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${SocialCubit.get(context).userModel!.name}',
                        style: TextStyle(height: 1),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.check_circle,
                        size: 15,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Text(
                    '${model.dateTime}',
                    style: Theme.of(context).textTheme.caption!.copyWith(),
                  )
                ],
              )),
              SizedBox(
                width: 15,
              ),
              IconButton(onPressed: () {}, icon: Icon(IconBroken.More_Square))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),

          Text('${model.text}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              )),
          //  if (model.postImage != '')
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: Container(
          //     width: double.infinity,
          //     child: Wrap(
          //       children: [
          //         //   if (model.postImage != '')
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(end: 5),
          //           child: Container(
          //             height: 20,
          //             child: MaterialButton(
          //               onPressed: () {},
          //               child: Text(
          //                 '#software',
          //                 style: TextStyle(color: Colors.blue),
          //               ),
          //               minWidth: 1,
          //               padding: EdgeInsets.zero,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(end: 5),
          //           child: Container(
          //             height: 20,
          //             child: MaterialButton(
          //               onPressed: () {},
          //               child: Text(
          //                 '#flutter',
          //                 style: TextStyle(color: Colors.blue),
          //               ),
          //               minWidth: 1,
          //               padding: EdgeInsets.zero,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          if (model.postImage != null)
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage('${model.postImage}'),
                  )),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            size: 20,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            IconBroken.Chat,
                            size: 20,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '0 comment',
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 7.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),

          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        '${SocialCubit.get(context).userModel!.image}'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'write a comment ...',
                    style: Theme.of(context).textTheme.caption!.copyWith(),
                  ),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  SocialCubit.get(context)
                      .likePost(SocialCubit.get(context).postsId[index]);
                },
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Heart,
                      size: 18,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'like',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  // SocialCubit.get(context)
                  //     .likePost(SocialCubit.get(context).postsId[index]);
                },
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Upload,
                      size: 18,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'share',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ));
}
