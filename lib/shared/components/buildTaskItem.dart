// import 'package:flutter/material.dart';
// import 'package:udemy_flutter/shared/cubit/cubit.dart';
//
// class BuildTaskItem extends StatelessWidget {
//   Map model;
//
//   BuildTaskItem({
//     this.model,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       //TODO:key??
//       key: Key(model['id'].toString()),
//       onDismissed: (direction) {
//         AppCubit.get(context).deleteData(id: model['id']);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 40.0,
//               child: Text(
//                 '${model['time']}',
//               ),
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model['title']}',
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '${model['date']}',
//                     style: TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context)
//                     .updateData(status: 'done', id: model['id']);
//               },
//               icon: Icon(
//                 Icons.check_box,
//                 color: Colors.green,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context)
//                     .updateData(status: 'archive', id: model['id']);
//               },
//               icon: Icon(
//                 Icons.archive,
//                 color: Colors.black54,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
