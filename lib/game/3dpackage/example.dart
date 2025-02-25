// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ikhtiyar_dosmetov/common/helpers.dart';
// import 'package:ikhtiyar_dosmetov/common/local_data.dart';
// import 'package:ikhtiyar_dosmetov/common/theme.dart';
//
// import '../common/assets.dart';
// import '3dpackage/src/flip_bar_item.dart';
// import '3dpackage/src/flip_box_bar (1).dart';
//
// class Tester extends StatefulWidget {
//   const Tester({super.key});
//
//   @override
//   State<Tester> createState() => _TesterState();
// }
//
// class _TesterState extends State<Tester> {
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     double displayWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('3D Animated Navigation Bar'),
//       ),
//       bottomNavigationBar: FlipBoxBar(
//         selectedIndex: selectedIndex,
//         items: [
//           FlipBarItem(
//               icon: Icon(Icons.map),
//               text: Text('Map'),
//               frontColor: Colors.blue,
//               backColor: Colors.blueAccent),
//           FlipBarItem(
//               icon: Icon(Icons.add),
//               text: Text('Add'),
//               frontColor: Colors.cyan,
//               backColor: Colors.cyanAccent),
//           FlipBarItem(
//               icon: Icon(Icons.chrome_reader_mode),
//               text: Text('Read'),
//               frontColor: Colors.orange,
//               backColor: Colors.orangeAccent),
//           FlipBarItem(
//               icon: Icon(Icons.chat),
//               text: Text('Chat'),
//               frontColor: Colors.pink,
//               backColor: Colors.pinkAccent),
//           FlipBarItem(
//               icon: Icon(Icons.ac_unit),
//               text: Text('Unit'),
//               frontColor: Colors.purple,
//               backColor: Colors.purpleAccent),
//         ],
//         onIndexChanged: (newIndex) {
//           setState(() {
//             selectedIndex = newIndex;
//           });
//         },
//       ),
//     );
//   }
//
//   Widget bnbItem({
//     required bool isTap,
//     required String icon,
//     required String text,
//     required int index,
//   }) {
//     return AnimatedContainer(
//       duration: const Duration(seconds: 1),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50.o),
//         border: isTap
//             ? Border.all(
//           color: theme.green,
//           width: 1.o,
//         )
//             : null,
//       ),
//       curve: Curves.fastLinearToSlowEaseIn,
//       padding: EdgeInsets.all(index == 5 ? 0 : 8.o),
//       child: index == 5
//           ? Container(
//         width: 40.o,
//         height: 40.o,
//         decoration: BoxDecoration(
//             color: theme.black,
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: theme.white2.withOpacity(0.24),
//                 spreadRadius: 1,
//                 blurRadius: 1,
//               ),
//             ]),
//         child: SvgPicture.asset(
//           icon,
//           fit: BoxFit.none,
//           colorFilter: theme.colorFilter,
//           height: 26.o,
//           width: 26.o,
//         ),
//       )
//           : Row(
//         children: [
//           SvgPicture.asset(
//             icon,
//             colorFilter: theme.colorFilter,
//             height: 18.o,
//             width: 18.o,
//           ),
//           sizeVer(8.o),
//           AnimatedOpacity(
//             opacity: isTap ? 1 : 0,
//             duration: Duration(seconds: 1),
//             curve: Curves.fastLinearToSlowEaseIn,
//             child: Text(
//               isTap ? text : '',
//               style: theme.textStyle.copyWith(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 12.o,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // * bnb all icons
// List<IconData> listOfIcons = [
//   Icons.home_rounded,
//   Icons.favorite_rounded,
//   Icons.settings_rounded,
//   Icons.person_rounded,
//   Icons.person_rounded,
// ];
//
// List<String> listOfStrings = [
//   'Home',
//   'Favorite',
//   'Settings',
//   'Account',
//   'Account',
// ];
