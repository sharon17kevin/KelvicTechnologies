import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/homeHelpers/standardButton.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rive/rive.dart';

class ServiceInfo extends StatelessWidget {
  final String title;
  final String content;
  final Widget page;
  String? animation;

  ServiceInfo({required this.title, required this.content, required this.page, this.animation});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 630 : 430 ,
      child: ResponsiveRowColumn(
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        columnSpacing: 10,
        rowPadding: const EdgeInsets.all(10),
        columnPadding: const EdgeInsets.only(top: 30, bottom: 10, left: 30, right: 30),
        layout: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnFlex: 1,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 100),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: -17,
                    left: -17,
                    child: Container(
                      width: 288,
                      height: 282,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xff0000A3),
                              width: 2.5
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 288,
                    height: 282,
                    color: Color(0xffF7F7FF),
                    alignment: Alignment.center,
                    child: RiveAnimation.network(
                      'https://cdn.rive.app/animations/vehicles.riv',
                      fit: BoxFit.cover,
                      placeHolder: Container(
                        color: Colors.yellow,
                        width: 50,
                        height: 50,
                      ),
                    )
                    // Image.asset(
                    //   'images/mast.webp',
                    //   height: 200,
                    //   fit: BoxFit.fitHeight,
                    // ),
                  ),
                ],
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            columnFlex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(title,
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          color: Color(0xff0000A3)
                      ),
                    ),
                  ),
                  Text(content,
                    maxLines: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 9 : 15,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 13 : 15,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff00003D)
                    ),
                  ),
                  StandardButton(
                    primaryColor: Color(0xff0000A3),
                    secondaryColor: Color(0xff7070FF).withOpacity(0.2),
                    primaryTextColor: Colors.white,
                    secondaryTextColor: Color(0xff0000A3),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
