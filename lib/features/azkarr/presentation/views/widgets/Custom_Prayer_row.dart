import 'package:flutter/material.dart';

class CustomPrayerRow extends StatelessWidget {
  final String time;
  final String name;
  final String iconLink;
  const CustomPrayerRow({
    super.key,
    required this.time,
    required this.name,
    required this.iconLink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 50,
        width: 400,
        decoration: BoxDecoration(
          color: Color(0xfff5d59c),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Text(time, style: TextStyle(fontSize: 20, color: Colors.black)),
              Spacer(),
              Text(name, style: TextStyle(fontSize: 20, color: Colors.black)),

              Image(
                width: 45,
                height: 30,
                fit: BoxFit.cover,
                image: AssetImage(iconLink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
