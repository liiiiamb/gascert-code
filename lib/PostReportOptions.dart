// import 'package:flutter/material.dart';
// import 'package:gascert/CreateReport.dart';
// import 'package:gascert/DisplayReport.dart';
// import 'package:gascert/TestDisplayUser.dart';

// class PostReportOptions extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Choose an Option"),
//         backgroundColor: Colors.green.shade300,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //     builder: (context) => DisplayReport(),
//                   //   ),
//                   // );
//                 },
//                 child: Text('View Report'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.grey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   side: BorderSide(color: Colors.black),
//                   minimumSize: Size(20, 40),
//                 )),
//             SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => TestDisplayUser(),
//                     ),
//                   );
//                 },
//                 child: Text('View Past Reports'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.grey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   side: BorderSide(color: Colors.black),
//                   minimumSize: Size(20, 40),
//                 )),
//             SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CreateReport(),
//                     ),
//                   );
//                 },
//                 child: Text('Create New Report'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.grey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   side: BorderSide(color: Colors.black),
//                   minimumSize: Size(20, 40),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: PostReportOptions(),
//   ));
// }
