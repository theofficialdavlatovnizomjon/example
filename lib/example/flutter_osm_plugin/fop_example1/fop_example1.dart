// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
//
// class FopExample1 extends StatefulWidget {
//   const FopExample1({super.key});
//
//   @override
//   State<FopExample1> createState() => _FopExample1State();
// }
//
// class _FopExample1State extends State<FopExample1> with OSMMixinObserver {
//   final Key key = GlobalKey();
//   ValueNotifier<bool> isTracking = ValueNotifier(false);
//   String address = '';
//   double long = 0;
//   double lat = 0;
//   late MapController controller = MapController.withUserPosition(
//     trackUserLocation: const UserTrackingOption(
//       enableTracking: false,
//       unFollowUser: false,
//     ),
//   );
//
//   @override
//   void initState() {
//     super.initState();
//     controller.addObserver(this);
//     if (controller.listenerMapSingleTapping.value == null) {
//       controller.listenerMapSingleTapping.addListener(onMapSingleTap);
//     } else {
//       controller.listenerMapSingleTapping.removeListener(onMapSingleTap);
//     }
//     controller.listenerRegionIsChanging.addListener(() {
//       if (controller.listenerRegionIsChanging.value != null) {}
//     });
//   }
//
//   void onMapSingleTap() async {
//     if (controller.listenerMapSingleTapping.value != null) {
//       final GeoPoint geoPoint = controller.listenerMapSingleTapping.value!;
//       await controller.addMarker(
//         geoPoint,
//         markerIcon: const MarkerIcon(
//           icon: Icon(
//             Icons.location_on_sharp,
//             color: Colors.blue,
//             size: 30,
//           ),
//         ),
//       );
//     }
//   }
//
//   getUserLocation() async {
//     Position location = await Geolocator.getCurrentPosition();
//     setState(() {
//       long = location.longitude;
//       lat = location.latitude;
//     });
//   }
//
//   void getAddress(Position position) async {
//     List<Placemark> placemark =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark place = placemark[0];
//     setState(() {
//       address =
//           '${place.administrativeArea}, ${place.locality}, ${place.street}';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//         elevation: 0,
//         title: const Text(
//           'Osm',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           OSMFlutter(
//             key: key,
//             controller: controller,
//             osmOption: const OSMOption(
//               zoomOption: ZoomOption(initZoom: 15),
//               // markerOption: MarkerOption(
//               //   defaultMarker: const MarkerIcon(
//               //     icon: Icon(Icons.add_location, color: Colors.amber),
//               //   ),
//               // ),
//               showContributorBadgeForOSM: false,
//             ),
//             onGeoPointClicked: (geoPoint) async {
//               setState(() {
//                 lat = geoPoint.latitude;
//                 long = geoPoint.longitude;
//               });
//             },
//           ),
//           Positioned(
//             bottom: 120,
//             right: 12,
//             child: InkWell(
//               onTap: () async {
//                 Position position = await Geolocator.getCurrentPosition(
//                     desiredAccuracy: LocationAccuracy.high);
//                 lat = position.latitude;
//                 long = position.longitude;
//                 getAddress(position);
//                 // ignore: use_build_context_synchronously
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     backgroundColor: Colors.blue,
//                     duration: const Duration(milliseconds: 1200),
//                     content: Text(
//                       address,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               child: Container(
//                 height: 48,
//                 width: 48,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.blue,
//                 ),
//                 alignment: Alignment.center,
//                 child: const Icon(
//                   Icons.location_on_outlined,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 40,
//             right: 12,
//             child: InkWell(
//               onTap: () async {
//                 if (isTracking.value) {
//                   await controller.disabledTracking();
//                 }
//                 if (!isTracking.value) {
//                   await controller.currentLocation();
//                   await controller.enableTracking();
//                 }
//                 isTracking.value = !isTracking.value;
//               },
//               child: Container(
//                 height: 48,
//                 width: 48,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.blue,
//                 ),
//                 alignment: Alignment.center,
//                 child: ValueListenableBuilder<bool>(
//                   valueListenable: isTracking,
//                   builder: (ctx, tracking, _) {
//                     return Icon(
//                       tracking ? Icons.location_disabled : Icons.my_location,
//                       color: Colors.white,
//                       size: 30,
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Future<void> mapIsReady(bool isReady) async {}
// }
