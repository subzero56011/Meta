import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/models/social_app/social_user_model.dart';
import 'package:meta_app/modules/social_app/social_register/cubit/states.dart';
import 'package:meta_app/shared/network/end_points.dart';
import 'package:meta_app/shared/network/remote/dio_helper.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    String email,
    String password,
    String name,
    String phone,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      userCreate(
        uId: value.user.uid,
        phone: phone,
        email: email,
        name: name,
      );
    }).catchError((onError) {
      print('error is${onError.toString()}');
      emit(SocialRegisterErrorState(onError.toString()));
    });
  }

  void userCreate({
    String email,
    String name,
    String phone,
    String uId,
  }) {
    SocialUserModel model = SocialUserModel(
      email: email,
      phone: phone,
      name: name,
      uId: uId,
      bio: 'a person who loves life!',
      cover:
          'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI',
      image:
          'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SocialCreateUserErrorState(onError.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
