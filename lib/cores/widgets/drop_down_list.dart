import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? selectedValue;

  final List<String> items = [
    '5 دقائق',
    '10 دقائق',
    '15 دقيقة',
    '30 دقيقة',
    'ساعة',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      hint: const Text('اختر المدة'),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
      items: items.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),
    );
  }
}
