// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:meta_app/shared/components/buildTaskItem.dart';
//
// class TasksBuilder extends StatelessWidget {
//   final List<Map> tasks;
//
//   const TasksBuilder({this.tasks});
//
//   @override
//   Widget build(BuildContext context) {
//     return ConditionalBuilder(
//       condition: tasks.length > 0,
//       builder: (context) => ListView.separated(
//           itemBuilder: (context, index) => BuildTaskItem(
//                 model: tasks[index],
//               ),
//           separatorBuilder: (context, index) => Padding(
//                 padding: const EdgeInsetsDirectional.only(
//                   start: 20.0,
//                 ),
//                 child: Container(
//                   width: double.infinity,
//                   height: 1.0,
//                   color: Colors.grey[300],
//                 ),
//               ),
//           itemCount: tasks.length),
//       fallback: (context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.menu,
//               size: 100,
//               color: Colors.grey,
//             ),
//             Text(
//               'no Tasks Yet',
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
