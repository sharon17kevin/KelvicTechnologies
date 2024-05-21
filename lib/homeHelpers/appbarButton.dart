import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBarButton extends StatelessWidget {
  final String title;
  final String image;
  AppBarButton({required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            image,
            height: 15,
          ),
          SizedBox(width: 15),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text(title,
              style: GoogleFonts.inter(
                color: Color(0xff414178),
                fontWeight: FontWeight.w300,
                fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 11 : 13,
              ),
            ),
          ), // Replace with your desired text
        ],
      ),
    );
  }
}

class LogoButton extends StatelessWidget {
  final String title;
  final String image;
  LogoButton({required this.title, required this.image});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Get.toNamed('/');
      },
      child: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 40,
            ),
            SizedBox(width: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(title,
                style: GoogleFonts.iceberg(
                  color: Color(0xff0000A3),
                  fontWeight: FontWeight.w500,
                  fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 14 : 17 ,
                ),
              ),
            ), // Replace with your desired text
          ],
        ),
      ),
    );
  }
}

