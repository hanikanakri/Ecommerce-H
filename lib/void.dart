// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
//
// class MyCustomWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext c) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('VIEW ANIMATING LISTVIEW'),
//           onPressed: () {
//             Navigator.push(
//               c,
//               MaterialPageRoute(builder: (context) => SlideAnimation2()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class SlideAnimation2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double _w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Go Back"),
//           centerTitle: true, systemOverlayStyle: SystemUiOverlayStyle.dark),
//       body: AnimationLimiter(
//         child: ListView.builder(
//           padding: EdgeInsets.all(_w / 30),
//           physics:
//           const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//           itemCount: 20,
//           itemBuilder: (BuildContext context, int index) {
//             return AnimationConfiguration.staggeredList(
//               position: index,
//               delay: const Duration(milliseconds: 100),
//               child: SlideAnimation(
//                 duration: const Duration(milliseconds: 2500),
//                 curve: Curves.fastLinearToSlowEaseIn,
//                 horizontalOffset: -300,
//                 verticalOffset: -850,
//                 child: Container(
//                   margin: EdgeInsets.only(bottom: _w / 20),
//                   height: _w / 4,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 40,
//                         spreadRadius: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }