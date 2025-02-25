// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//
// class StandardPaginationPage extends StatefulWidget {
//   const StandardPaginationPage({super.key});
//
//   @override
//   State<StandardPaginationPage> createState() => _StandardPaginationPageState();
// }
//
// class _StandardPaginationPageState extends State<StandardPaginationPage> {
//   final controller = ScrollController();
//   List<String> items = [];
//   bool hasMore = true;
//   bool isLoading = false;
//   int page = 1;
//
//   @override
//   void initState() {
//     fetch();
//     controller.addListener(() {
//       if (controller.position.maxScrollExtent == controller.offset) {
//         fetch();
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   Future fetch() async {
//     if (isLoading) return;
//     isLoading = true;
//     const limit = 25;
//     final url = Uri.parse(
//         'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final List newItems = json.decode(response.body);
//       setState(() {
//         page++;
//         isLoading = false;
//         if (newItems.length < limit) {
//           hasMore = false;
//         }
//         items.addAll(
//           newItems.map(
//             (e) {
//               final number = e['id'];
//               return 'Item $number';
//             },
//           ).toList(),
//         );
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Pagination',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//             fontSize: 30,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         controller: controller,
//         padding: const EdgeInsets.all(20),
//         itemCount: items.length + 1,
//         itemBuilder: (context, index) {
//           if (index < items.length) {
//             final item = items[index];
//             return ListTile(
//               title: Text(item),
//             );
//           } else {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 32),
//               child: Center(
//                 child: hasMore
//                     ? const CircularProgressIndicator()
//                     : const Text('No more data to load'),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
