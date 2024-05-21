import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/screens/aboutScreen.dart';
import 'package:kelvic_technologies/screens/blogScreen.dart';
import 'package:kelvic_technologies/screens/homeScreen.dart';
import 'package:kelvic_technologies/screens/productsScreen.dart';
import 'package:kelvic_technologies/screens/serviceScreen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppBarTab extends StatefulWidget {
  final String title;
  final int link;

  AppBarTab({required this.title, required this.link});

  @override
  State<AppBarTab> createState() => _AppBarTabState();
}

class _AppBarTabState extends State<AppBarTab> {
  var tabs = [
    '/',
    '/About',
    '/Product',
    '/Services',
    '/Blog'
  ];
  bool isHovered = false;

  void onEntered(bool isHovered) => setState(() {
    this.isHovered = isHovered;
  });
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event){
        onEntered(true);
      },
      onExit: (event) {
        onEntered(false);
      },
      child: GestureDetector(
        onTap: () {
          Get.toNamed(tabs[widget.link]);
        },
        child: Container(
          height: double.maxFinite,
          color: isHovered? Color(0xffF7F7FF) : Colors.white,
          width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 80 : 100 ,
          alignment: Alignment.center,
          child: Text(
              widget.title,
            style: GoogleFonts.inter(
              fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 12 : 15 ,
            ),
          ),
        ),
      ),
    );
  }
}
