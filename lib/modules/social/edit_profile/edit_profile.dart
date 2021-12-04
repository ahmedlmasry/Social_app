import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groub/layout/social%20app/cubit/cubit.dart';
import 'package:groub/layout/social%20app/cubit/states.dart';
import 'package:groub/shared/components/components.dart';
import 'package:groub/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = SocialCubit.get(context).userModel;
          var profileImage = SocialCubit.get(context).profileImage;
          var coverImage = SocialCubit.get(context).coverImage;

          nameController.text = model!.name!;
          bioController.text = model.bio!;
          phoneController.text = model.phone!;

          return Scaffold(
            appBar: AppBar(
              titleSpacing: 5,
              title: Text('Edit Profile'),
              actions: [
                defaultTextButton(
                    function: () {
                      // SocialCubit.get(context).uploadProfileImage();
                      SocialCubit.get(context).updateUser(
                          bio: bioController.text,
                          phone: phoneController.text,
                          name: nameController.text);
                    },
                    text: 'update'),
                SizedBox(
                  width: 15,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (state is SocialUserUpdateLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 170,
                      child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: coverImage == null
                                                ? NetworkImage('${model.cover}')
                                                : FileImage(coverImage)
                                                    as ImageProvider)),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        SocialCubit.get(context)
                                            .getcoverImage();
                                      },
                                      icon: CircleAvatar(
                                          radius: 15,
                                          child:
                                              Icon(Icons.camera_alt_outlined)))
                                ],
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 64,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage: profileImage == null
                                          ? NetworkImage('${model.image}')
                                          : FileImage(profileImage)
                                              as ImageProvider),
                                ),
                                IconButton(
                                    onPressed: () {
                                      SocialCubit.get(context)
                                          .getprofileImage();
                                    },
                                    icon: CircleAvatar(
                                        radius: 15,
                                        child: Icon(Icons.camera_alt_outlined)))
                              ],
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    if (SocialCubit.get(context).profileImage != null ||
                        SocialCubit.get(context).coverImage != null)
                      Row(
                        children: [
                          if (SocialCubit.get(context).profileImage != null)
                            Expanded(
                                child: Column(
                              children: [
                                defaultButton(
                                    function: () {
                                      SocialCubit.get(context)
                                          .uploadProfileImage(
                                              name: nameController.text,
                                              phone: phoneController.text,
                                              bio: bioController.text);
                                    },
                                    text: 'upload profile image'),
                                if (state is SocialUserUpdateLoadingState)
                                  SizedBox(
                                    height: 5,
                                  ),
                                if (state is SocialUserUpdateLoadingState)
                                  LinearProgressIndicator(),
                              ],
                            )),
                          SizedBox(
                            width: 5,
                          ),
                          if (SocialCubit.get(context).coverImage != null)
                            Expanded(
                                child: Column(
                              children: [
                                defaultButton(
                                    function: () {
                                      SocialCubit.get(context).uploadCoverImage(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          bio: bioController.text);
                                    },
                                    text: 'upload cover image'),
                                if (state is SocialUserUpdateLoadingState)
                                  SizedBox(
                                    height: 5,
                                  ),
                                if (state is SocialUserUpdateLoadingState)
                                  LinearProgressIndicator(),
                              ],
                            ))
                        ],
                      ),
                    if (SocialCubit.get(context).profileImage != null ||
                        SocialCubit.get(context).coverImage != null)
                      SizedBox(
                        height: 30,
                      ),
                    defalutFormfeild(
                        controller: nameController,
                        type: TextInputType.name,
                        valdiate: (value) {
                          if (value.isEmpty) {
                            return 'name must not be empty';
                          }
                        },
                        label: 'name',
                        prefix: IconBroken.Profile),
                    SizedBox(
                      height: 15,
                    ),
                    defalutFormfeild(
                        controller: bioController,
                        type: TextInputType.text,
                        valdiate: (value) {
                          if (value.isEmpty) {
                            return 'bio .. must not be empty';
                          }
                        },
                        label: 'bio ...',
                        prefix: IconBroken.Info_Circle),
                    SizedBox(
                      height: 15,
                    ),
                    defalutFormfeild(
                        controller: phoneController,
                        type: TextInputType.phone,
                        valdiate: (value) {
                          if (value.isEmpty) {
                            return 'phone must not be empty';
                          }
                        },
                        label: 'phone',
                        prefix: IconBroken.Call),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
