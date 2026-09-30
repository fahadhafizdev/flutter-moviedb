// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_movie_catalog/core/constants/colors.dart';
// import 'package:flutter_movie_catalog/core/core.dart';
// import 'package:flutter_movie_catalog/core/src/image_string.dart';

// import 'card_movie.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColors.primary,
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SpaceHeight(40),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Movie Catalog',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Icon(Icons.search, color: AppColors.white),
//                   ],
//                 ),
//               ),
//               SpaceHeight(20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Top Movies',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'SEE ALL',
//                       style: TextStyle(
//                         color: AppColors.green,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SpaceHeight(20),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SpaceWidth(24),
//                     CardMovie(),
//                     CardMovie(),
//                     CardMovie(),
//                   ],
//                 ),
//               ),
//               SpaceHeight(34),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Popular this week',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       'SEE ALL',
//                       style: TextStyle(
//                         color: AppColors.green,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SpaceHeight(20),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SpaceWidth(24),
//                     CardMovie(),
//                     CardMovie(),
//                     CardMovie(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
