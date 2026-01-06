import 'package:azkaar/features/azkarr/data/models/quraan_mode/ayah.dart';
import 'package:azkaar/features/azkarr/presentation/manager/page_cubit.dart/page_cubit.dart';
import 'package:azkaar/features/azkarr/presentation/manager/page_cubit.dart/page_cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class QurranPageBody extends StatelessWidget {
//   const QurranPageBody({
//     super.key,
//     required this.pageNumber,
//     required this.basmala,
//   });

//   final int pageNumber;
//   final String basmala;

//   List<Widget> buildPageContent(List<Ayah> ayahs) {
//     final widgets = <Widget>[];
//     int? currentSurah;
//     final buffer = StringBuffer();

//     void flushAyahs() {
//       if (buffer.isNotEmpty) {
//         widgets.add(
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Text(
//                 buffer.toString(),
//                 textDirection: TextDirection.rtl,
//                 textAlign: TextAlign.justify,
//                 style: const TextStyle(
//                   fontFamily: 'Aref Ruqaa',
//                   fontSize: 18,
//                   height: 2,
//                 ),
//               ),
//             ),
//           ),
//         );
//         buffer.clear();
//       }
//     }

//     for (final ayah in ayahs) {
//       if (currentSurah != ayah.surahNumber) {
//         flushAyahs();
//         currentSurah = ayah.surahNumber;

//         /// 🟢 بوردر اسم السورة
//         widgets.add(
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 2),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 Image.asset(
//                   "lib/cores/assets/images/bordermae.jpg",
//                   width: 260,
//                 ),
//                 //const SizedBox(height: 4),
//                 Text(
//                   ayah.surahName!,
//                   textDirection: TextDirection.rtl,
//                   style: const TextStyle(
//                     fontFamily: 'Aref Ruqaa',
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );

//         /// 🟢 البسملة (إلا التوبة)
//         if (ayah.surahName != "سُورَةُ التَّوۡبَةِ") {
//           widgets.add(
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10, bottom: 2),
//                 child: Text(
//                   basmala,
//                   textDirection: TextDirection.rtl,
//                   style: const TextStyle(
//                     fontFamily: 'Aref Ruqaa',
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//       }

//       /// 🟢 الآيات متصلة
//       buffer.write('${ayah.text} ﴿${ayah.numberInSurah}﴾ ');
//     }

//     flushAyahs();
//     return widgets;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => QuranPageCubit()..getPage(pageNumber),
//       child: BlocBuilder<QuranPageCubit, QuranPageState>(
//         builder: (context, state) {
//           if (state is QuranPageLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (state is QuranPageSuccess) {
//             return Positioned(
//               child: Stack(
//                 children: [
//                   /// 🟢 خلفية الصفحة
//                   Positioned.fill(
//                     child: SizedBox(
//                       height: double.infinity,
//                       child: Image.asset(
//                         pageNumber < 3
//                             ? "lib/cores/assets/images/fir.jpg"
//                             : "lib/cores/assets/images/bor.jpg",
//                         fit: pageNumber < 2 ? BoxFit.fill : BoxFit.fill,
//                       ),
//                     ),
//                   ),

//                   /// 🟢 المحتوى
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(
//                       30,
//                       120,
//                       30,
//                       pageNumber < 3 ? 250 : 90,
//                     ),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: buildPageContent(state.ayahs),
//                       ),
//                     ),
//                   ),

//                   /// 🟢 رقم الصفحة (أسفل شمال)
//                   Positioned(
//                     bottom: 10,
//                     left: 185,
//                     child: Text(
//                       pageNumber.toString(),
//                       style: const TextStyle(
//                         fontFamily: 'Aref Ruqaa',
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }

//           if (state is QuranPageFailure) {
//             return Center(child: Text(state.errMessage));
//           }

//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }
class QurranPageBody extends StatelessWidget {
  QurranPageBody({super.key, required this.pageNumber, required this.basmala});
  int currentNum = 1;
  final int pageNumber;
  final String basmala;

  List<Widget> buildPageContent(List<Ayah> ayahs) {
    final widgets = <Widget>[];
    int? currentSurah;
    final buffer = StringBuffer();

    void flushAyahs() {
      if (buffer.isNotEmpty) {
        widgets.add(
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              buffer.toString(),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Aref Ruqaa',
                fontSize: currentNum != 1 && !(pageNumber < 3) ? 18 : 19,
                height: 2,
              ),
            ),
          ),
        );
        buffer.clear();
      }
    }

    for (final ayah in ayahs) {
      if (ayah.numberInSurah == 1) {
        flushAyahs();
        currentSurah = ayah.surahNumber;

        currentNum = currentSurah!;

        /// 🟢 بوردر اسم السورة
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "lib/cores/assets/images/bordermae.jpg",
                  width: 300,
                  height: 80,
                ),
                Text(
                  ayah.surahName ?? '',
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontFamily: 'Aref Ruqaa',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );

        /// 🟢 البسملة (إلا التوبة)
        if (ayah.surahName != "سُورَةُ التَّوۡبَةِ") {
          widgets.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                basmala,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Aref Ruqaa', fontSize: 18),
              ),
            ),
          );
        }
      }

      /// 🟢 الآيات متصلة
      buffer.write('${ayah.text} ﴿${ayah.numberInSurah}﴾ ');
    }

    flushAyahs();
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuranPageCubit()..getPage(pageNumber),
      child: BlocBuilder<QuranPageCubit, QuranPageState>(
        builder: (context, state) {
          if (state is QuranPageLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is QuranPageSuccess) {
            return Stack(
              children: [
                // 🟢 خلفية الصفحة
                if (pageNumber < 3)
                  Positioned.fill(
                    child: Image.asset(
                      pageNumber < 3 ? "lib/cores/assets/images/fir.jpg" : "",
                      fit: BoxFit.fill,
                    ),
                  ),

                /// 🟢 المحتوى
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    currentNum == 1 && !(pageNumber < 3) ? 20 : 50,
                    currentNum == 1 && !(pageNumber < 3) ? 10 : 120,
                    currentNum == 1 && !(pageNumber < 3) ? 20 : 50,
                    currentNum != 1 && !(pageNumber < 3) ? 0 : 0,
                  ),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: buildPageContent(state.ayahs),
                    ),
                  ),
                ),

                /// 🟢 رقم الصفحة (أسفل شمال)
                Positioned(
                  bottom: !(pageNumber < 3) ? 7 : 50,
                  left: !(pageNumber < 3) ? 193 : 190,
                  child: Text(
                    pageNumber.toString(),
                    style: const TextStyle(
                      fontFamily: 'Aref Ruqaa',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            );
          }

          if (state is QuranPageFailure) {
            return Center(child: Text(state.errMessage));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
