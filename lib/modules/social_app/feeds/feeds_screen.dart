import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta_app/layout/social_app/cubit/cubit.dart';
import 'package:meta_app/layout/social_app/cubit/states.dart';
import 'package:meta_app/models/social_app/post_model.dart';
import 'package:meta_app/shared/components/components.dart';
import 'package:meta_app/shared/styles/colors.dart';
import 'package:meta_app/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length > 0,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://image.shutterstock.com/image-illustration/letter-m-sliced-white-color-260nw-1917097091.jpg'),
                        fit: BoxFit.cover,
                        height: 180.0,
                        width: double.infinity,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Communicate With Friends',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItem(
                      SocialCubit.get(context).posts[index], context, index),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.0,
                  ),
                  itemCount: SocialCubit.get(context).posts.length,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildPostItem(PostModel model, context, index) => Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        elevation: 3.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('${model.image}'),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.name}',
                              style: TextStyle(
                                height: 1.4,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: defaultColor,
                              size: 16.0,
                            ),
                          ],
                        ),
                        Text(
                          '${model.dateTime}',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                height: 1.4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                '${model.text}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(end: 6.0),
              //           child: Container(
              //             height: 20.0,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 25.0,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#software',
              //                 style: TextStyle(color: defaultColor),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (model.postImage != '')
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 5.0,
                  ),
                  child: Container(
                    height: 190.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${model.postImage}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                size: 17.0,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '${SocialCubit.get(context).likes[index]}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconBroken.Chat,
                                size: 17.0,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '0',
                                // '${SocialCubit.get(context).comments[index]}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                                '${SocialCubit.get(context).userModel.image}'),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'write a comment',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  height: 1.4,
                                ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // SocialCubit.get(context).comment(SocialCubit.get(context).postsId[index]);
                      },
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 17.0,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {
                      SocialCubit.get(context)
                          .likePost(SocialCubit.get(context).postsId[index]);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
