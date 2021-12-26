import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta_app/layout/social_app/cubit/cubit.dart';
import 'package:meta_app/layout/social_app/cubit/states.dart';
import 'package:meta_app/shared/components/Button.dart';
import 'package:meta_app/shared/components/DefaultTextForm.dart';
import 'package:meta_app/shared/components/components.dart';
import 'package:meta_app/shared/components/default_text_button.dart';
import 'package:meta_app/shared/styles/colors.dart';
import 'package:meta_app/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        nameController.text = userModel.name;
        phoneController.text = userModel.phone;
        bioController.text = userModel.bio;

        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              DefaultTextButton(
                text: Text(
                  'Update',
                  style: TextStyle(color: Colors.black),
                ),
                function: () {
                  SocialCubit.get(context).updateUser(
                    name: nameController.text,
                    bio: bioController.text,
                    phone: phoneController.text,
                  );
                },
              ),
              SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is SocialUserUpdateLoadingState)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 140.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: coverImage == null
                                      ? NetworkImage(
                                          '${userModel.cover}',
                                        )
                                      : FileImage(coverImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                SocialCubit.get(context).getCoverImage();
                              },
                              icon: CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 35.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            radius: 65.0,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: profileImage == null
                                  ? NetworkImage('${userModel.image}')
                                  : FileImage(profileImage),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              SocialCubit.get(context).getProfileImage();
                            },
                            icon: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 35.0,
                              child: Icon(
                                IconBroken.Camera,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).coverImage != null)
                  Row(
                    children: [
                      if (SocialCubit.get(context).profileImage != null)
                        Expanded(
                          child: Column(
                            children: [
                              Button(
                                function: () {
                                  SocialCubit.get(context).uploadProfileImage(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    bio: bioController.text,
                                  );
                                },
                                text: 'upload profile ',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          ),
                        ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if (SocialCubit.get(context).coverImage != null)
                        Expanded(
                          child: Column(
                            children: [
                              Button(
                                function: () {
                                  SocialCubit.get(context).uploadCoverImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text);
                                },
                                text: 'upload cover ',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              if (state is SocialUserUpdateLoadingState)
                                LinearProgressIndicator(),
                            ],
                          ),
                        ),
                    ],
                  ),
                if (SocialCubit.get(context).profileImage != null ||
                    SocialCubit.get(context).profileImage != null)
                  SizedBox(
                    height: 20.0,
                  ),
                DefaultFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  label: 'Name',
                  prefix: IconBroken.User,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'name must not be empty';
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                DefaultFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.name,
                  label: 'Phone',
                  prefix: IconBroken.User,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'phone must not be empty';
                    }
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                DefaultFormField(
                  controller: bioController,
                  keyboardType: TextInputType.text,
                  label: 'Bio',
                  prefix: IconBroken.Info_Circle,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Bio must not be empty';
                    }
                  },
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
