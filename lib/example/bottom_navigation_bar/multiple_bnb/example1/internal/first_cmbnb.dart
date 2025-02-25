// import 'package:example/example/multiple_bottom_navigation_bar/page/test_cmbnb.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FirstCMBNB extends StatelessWidget {
//   final String title;
//
//   const FirstCMBNB({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(
//       backgroundColor: Colors.deepPurple,
//       title: Text(
//         title,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//           fontSize: 24,
//         ),
//       ),
//     ),
//     body: SizedBox(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//               fontSize: 28,
//             ),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.deepPurple,
//               fixedSize: const Size(150, 40),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             onPressed: () =>
//                 Navigator.of(context, rootNavigator: false).push(
//                   CupertinoPageRoute(
//                     builder: (context) => const TestCMBNB(),
//                   ),
//                 ),
//             child: Text(
//               title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
