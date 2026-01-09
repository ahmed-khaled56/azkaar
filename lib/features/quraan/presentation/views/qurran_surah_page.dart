import 'package:azkaar/features/quraan/presentation/views/widgets/qurran_page_body.dart';
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
  static const int totalPages = 604;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 231, 218),
      body: PageView.builder(
        controller: PageController(initialPage: firstPage - 1),
        itemCount: totalPages,
        reverse: true, // 👈 مهم عشان الاتجاه عربي
        itemBuilder: (context, index) {
          final pageNumber = index + 1;

          return QurranPageBody(pageNumber: pageNumber, basmala: basmal);
        },
      ),
    );
  }
}
