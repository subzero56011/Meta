import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta_app/layout/social_app/cubit/cubit.dart';
import 'package:meta_app/layout/social_app/cubit/states.dart';
import 'package:meta_app/modules/social_app/new_post/new_post_screen.dart';
import 'package:meta_app/shared/components/Button.dart';
import 'package:meta_app/shared/components/components.dart';
import 'package:meta_app/shared/components/default_text_button.dart';
import 'package:meta_app/shared/components/navigate_to.dart';
import 'package:meta_app/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (BuildContext context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(IconBroken.Notification),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(IconBroken.Search),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Download),
                label: 'Post',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(IconBroken.Location),
              //   label: 'Users',
              // ),
              BottomNavigationBarItem(
                icon: Icon(IconBroken.Setting),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}

//email ver               var model = SocialCubit.get(context).model;
//               return Column(
//                 children: [
//                   if (!FirebaseAuth.instance.currentUser.emailVerified)
//                     Container(
//                       color: Colors.amber.withOpacity(.6),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 20.0,
//                         ),
//                         child: Row(
//                           children: [
//                             Icon(Icons.warning),
//                             SizedBox(
//                               width: 15.0,
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'please verify your email',
//                               ),
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             DefaultTextButton(
//                               text: Text('Send'),
//                               function: () {
//                                 FirebaseAuth.instance.currentUser
//                                     .sendEmailVerification()
//                                     .then((value) {
//                                   showToast(
//                                       text: 'check you mail',
//                                       state: ToastStates.SUCCESS);
//                                 }).catchError((onError) {});
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                 ],
//               );
