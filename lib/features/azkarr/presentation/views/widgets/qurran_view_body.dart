import 'package:azkaar/features/azkarr/data/models/quraan_mode/quraan_mode.dart';
import 'package:azkaar/features/azkarr/presentation/views/qurran_surah_page.dart';
import 'package:azkaar/features/azkarr/presentation/views/widgets/custom_sura_name.dart';
import 'package:flutter/material.dart';

class QurranViewBody extends StatelessWidget {
  const QurranViewBody({super.key, required this.dataList});
  final List<QuraanMode> dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QurranPage(
                          quraanMode: dataList[index],
                          basmal: dataList[0].ayahs![0].text!,
                          pageNumber: dataList[index].ayahs![0].page!,
                        ),
                      ),
                    );
                  },
                  child: CustomSuraName(quraanMode: dataList[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
