// import 'package:azkaar/features/azkarr/data/models/quraan_mode/ayah.dart';
// import 'package:flutter/material.dart';

// class QuranPageView extends StatelessWidget {
//   final int pageNumber;

//   const QuranPageView({super.key, required this.pageNumber});

//   String buildPageText(List<Ayah> ayahs) {
//     String text = '';

//     for (var ayah in ayahs) {
//       text += '${ayah.text} ﴿${ayah.numberInSurah}﴾ ';
//     }

//     return text;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Ayah>>(
//       future: QuranApiService().fetchPage(pageNumber),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         final pageText = buildPageText(snapshot.data!);

//         return Scaffold(
//           backgroundColor: const Color(0xfff9f6ef),
//           body: SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 24,
//               ),
//               child: Text(
//                 pageText,
//                 textAlign: TextAlign.justify,
//                 textDirection: TextDirection.rtl,
//                 style: const TextStyle(
//                   fontFamily: 'Uthmanic',
//                   fontSize: 22,
//                   height: 2,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
