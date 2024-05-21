import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_framework.dart' as ResponsiveConditions show Condition;

class BottomPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: const Color(0xff0000A3),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("CONTACT\n",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                            ),),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child:
                          Text(
                            '''+2348037940145\n16 B Peace Avenue Iwofe Road\nPort Harcourt Nigeria\n90291\n''',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.w200
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "icons/facebook.svg",
                                height: 17,
                              ),
                              SvgPicture.asset(
                                "icons/twitter.svg",
                                height: 17,
                              ),
                              SvgPicture.asset(
                                "icons/instagram.svg",
                                height: 17,
                              ),
                              SvgPicture.asset(
                                "icons/youtube.svg",
                                height: 17,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ResponsiveVisibility(
                    visible: true,
                    hiddenConditions: [
                      ResponsiveConditions.Condition.smallerThan(
                        name : TABLET,
                        value: false,
                      )
                    ],
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("  HELP\n",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300
                              ),),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "FAQ'S",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Pricing Plans",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Track Your Order",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Returns",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveVisibility(
                    visible: true,
                    hiddenConditions: [
                      ResponsiveConditions.Condition.smallerThan(
                        name : 'ADJUST_APPBAR',
                        value: false,
                      )
                    ],
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("  ABOUT US\n",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300
                              ),),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Our Story",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Job Opportunities",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Store Locator",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Contact Us",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                  ResponsiveVisibility(
                    visible: true,
                    hiddenConditions: [
                      ResponsiveConditions.Condition.smallerThan(
                        name : 'ADJUST_APPBAR',
                        value: false,
                      )
                    ],
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text("  CUSTOMER SERVICES\n",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300
                              ),),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "My Account",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Contact Us",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Terms of Use",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Gift Card",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w200
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  )        ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 80 ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "icons/copyright.svg",
                    height: 10,
                  ),
                  Text("2023 Kelvic Technologies Limited, All Rights Reserved",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: ResponsiveBreakpoints.of(context).smallerThan(TABLET)? 10 : 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}
