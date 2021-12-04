import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/cubit/cubit.dart';
import 'package:groub/layout/social%20app/cubit/states.dart';
import 'package:groub/modules/social/edit_profile/edit_profile.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/styles/icon_broken.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SocialCubit.get(context).userModel;
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 170,
                  child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage('${model!.cover}'),
                                )),
                          ),
                        ),
                        CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage('${model.image}')),
                        )
                      ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${model.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '${model.bio}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                'post',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                '250',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                'photos',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                '150',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                'following',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                '10 k',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                'followers',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {}, child: Text('Add Photos'))),
                    SizedBox(
                      width: 10,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          navigateTo(context, EditProfileScreen());
                        },
                        child: Icon(IconBroken.Edit))
                  ],
                )
              ],
            ));
      },
    );
  }
}
