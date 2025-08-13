// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFFF8C00), // Orange background
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(), // Spacer for top
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Logo image
//                 Image.asset(
//                   'assets/logo.png', // Replace with your image in assets
//                   width: 100,
//                   height: 100,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Quizzia',
//                   style: TextStyle(
//                     fontFamily: 'Times New Roman', // Can change to your preferred font
//                     fontSize: 24,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             const Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: Text(
//                 'Developed by \${StudentName}', // Replace with your actual name
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
