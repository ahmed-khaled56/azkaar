import 'package:flutter/material.dart';

class customOnButton extends StatelessWidget {
  final bool? pressed;
  const customOnButton({super.key, this.pressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        color: pressed == true ? Colors.green : Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          child: Padding(
            padding: pressed == true
                ? EdgeInsets.only(left: 15, top: 3.5, bottom: 3.5)
                : EdgeInsets.only(right: 15, top: 3.5, bottom: 3.5),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff5d59c),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
