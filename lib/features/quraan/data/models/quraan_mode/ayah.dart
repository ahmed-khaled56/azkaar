import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final int? number;
  final String? text;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final dynamic sajda;
  final int? surahNumber;
  final String? surahName;

  const Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
    this.surahNumber,
    this.surahName,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    final surah = json['surah'];

    return Ayah(
      number: json['number'] as int?,
      text: json['text'] as String?,
      numberInSurah: json['numberInSurah'] as int?,
      juz: json['juz'] as int?,
      manzil: json['manzil'] as int?,
      page: json['page'] as int?,
      ruku: json['ruku'] as int?,
      hizbQuarter: json['hizbQuarter'] as int?,
      sajda: json['sajda'],
      surahNumber: surah is Map ? surah['number'] as int? : null,
      surahName: surah is Map ? surah['name'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'number': number,
    'text': text,
    'numberInSurah': numberInSurah,
    'juz': juz,
    'manzil': manzil,
    'page': page,
    'ruku': ruku,
    'hizbQuarter': hizbQuarter,
    'sajda': sajda,
    'surahNumber': surahNumber,
    'surahName': surahName,
  };

  @override
  List<Object?> get props => [
    number,
    text,
    numberInSurah,
    juz,
    manzil,
    page,
    ruku,
    hizbQuarter,
    sajda,
    surahNumber,
    surahName,
  ];
}
