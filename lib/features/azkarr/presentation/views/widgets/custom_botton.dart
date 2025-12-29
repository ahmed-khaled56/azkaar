import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    this.icontcolor,
    required this.lable,
    required this.onPressed,
    required this.buttoncolor,
    required this.Textcolor,
    this.icon,
    this.imageLink,
    this.hieght,
    this.width,
    this.fontSize,
    this.fontWeight,
  });

  final void Function() onPressed;
  final String lable;
  final Color buttoncolor;
  final Color Textcolor;
  final Color? icontcolor;
  final IconData? icon;
  final String? imageLink;
  final double? hieght;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width ?? screenWidth * 0.8,
      height: hieght ?? screenHeight * 0.065,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(color: Colors.black, width: 1.2),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageLink != null)
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Image.asset(imageLink!, height: 20),
              ),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Icon(icon, color: icontcolor),
              ),
            Text(
              lable,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.w600,
                color: Textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
