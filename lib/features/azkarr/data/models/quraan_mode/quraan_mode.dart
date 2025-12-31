import 'package:equatable/equatable.dart';

import 'ayah.dart';

class QuraanMode extends Equatable {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final String? revelationType;
  final List<Ayah>? ayahs;

  const QuraanMode({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.ayahs,
  });

  factory QuraanMode.fromJson(Map<String, dynamic> json) => QuraanMode(
    number: json['number'] as int?,
    name: json['name'] as String?,
    englishName: json['englishName'] as String?,
    englishNameTranslation: json['englishNameTranslation'] as String?,
    revelationType: json['revelationType'] as String?,
    ayahs: (json['ayahs'] as List<dynamic>?)
        ?.map((e) => Ayah.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'number': number,
    'name': name,
    'englishName': englishName,
    'englishNameTranslation': englishNameTranslation,
    'revelationType': revelationType,
    'ayahs': ayahs?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      revelationType,
      ayahs,
    ];
  }
}
