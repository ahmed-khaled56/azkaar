import 'package:azkaar/features/azkarr/data/models/quraan_mode/quraan_mode.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/qurran_page_body.dart';
import 'package:flutter/material.dart';

// class QurranPage extends StatelessWidget {
//   const QurranPage({
//     super.key,
//     required this.pageNumber,
//     required this.basmal,
//     required this.quraanMode,
//   });
//   final int pageNumber;
//   final String basmal;
//   final QuraanMode quraanMode;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffd9c7b8),
//       body: QurranPageBody(basmala: basmal, pageNumber: pageNumber),
//     );
//   }
// }

class QurranPage extends StatelessWidget {
  const QurranPage({
    super.key,
    required this.firstPage,
    required this.lastPage,
    required this.basmal,
  });

  final int firstPage;
  final int lastPage;
  final String basmal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 231, 218),
      // backgroundColor: const Color(0xffd9c7b8),
      body: PageView.builder(
        itemCount: (lastPage - firstPage) + 1,
        itemBuilder: (context, index) {
          final pageNumber = firstPage + index;

          return QurranPageBody(pageNumber: pageNumber, basmala: basmal);
        },
      ),
    );
  }
}
