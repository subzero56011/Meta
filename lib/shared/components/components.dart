import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:meta_app/shared/components/navigate_and_replace.dart';
import 'package:meta_app/shared/network/local/chache_helper.dart';
import 'package:meta_app/shared/styles/icon_broken.dart';

void showToast({
  String text,
  ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: chooseToastColor(state),
    fontSize: 16.0,
  );
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

//void signOut(context) {
//   CacheHelper.removeData(
//     key: 'token',
//   ).then((value) {
//     if (value) {
//       navigateAndFinish(context, ShopLoginScreen());
//     }
//   });
// }

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

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

Widget defaultAppBar({
  BuildContext context,
  String title,
  List<Widget> actions,
}) =>
    AppBar(
      titleSpacing: 5.0,
      leading: IconButton(
        icon: Icon(IconBroken.Arrow___Left_2),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
      ),
      actions: actions,
    );
