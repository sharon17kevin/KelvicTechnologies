import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/aboutHelpers/animatedSection.dart';
import 'package:kelvic_technologies/controllers/myAnimationController.dart';
import 'package:kelvic_technologies/homeHelpers/standardButton.dart';
import '../controllers/animatedSlideController.dart';
import 'package:responsive_framework/responsive_framework.dart' as ResponsiveConditions show Condition;
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';

class AnimatedSlider extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final int unique;
  final String uniqueText;
  final BoxFit myFit;
  final Key key;

  AnimatedSlider({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.unique,
    required this.uniqueText,
    required this.key,
    required this.myFit
  }) : super(key: key);

  @override
  _AnimatedSliderState createState() => _AnimatedSliderState();
}

class _AnimatedSliderState extends State<AnimatedSlider> with SingleTickerProviderStateMixin{
  final AnimatedSlideController _animatedSlideController = Get.find<AnimatedSlideController>();
  final MyAnimationController _animationController = Get.find<MyAnimationController>();
  late AnimationController imageController;
  late Animation<double> _animation;
  late Timer resetTimer;
  late Timer resetText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    resetTimer = Timer(
        Duration(seconds: 10),
            () {
          _animatedSlideController.goToNextPage();
        }
    );
    resetText = Timer(
        Duration(milliseconds: 0),
            () {
          _animationController.animationController.reset();
          _animationController.animationController.forward();
        }
    );
    _animation = CurvedAnimation(parent: imageController, curve: Curves.fastEaseInToSlowEaseOut);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    resetText.cancel();
    resetTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? 650 : 600,
      key: ValueKey(widget.unique),
      child: ResponsiveVisibility(
        visible: true,
        hiddenConditions: [
          ResponsiveConditions.Condition.smallerThan(
            name : 'ADJUST_PRODUCT',
            value: false,
          )
        ],
        child: Row(
          children: [
            Container(
              height: double.maxFinite,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 200,
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      height: 300,
                      width: 300,
                      child: AnimatedSection(
                        unique: widget.uniqueText,
                        begin: Offset(0, 0.15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: double.maxFinite,
                                alignment: Alignment.bottomCenter,
                                child: Text(widget.title,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 20 : 28,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff0000A3)

                                  ),
                                ),
                              ),
                            ),
                            //SizedBox(height: 10,),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: double.maxFinite,
                                alignment: Alignment.topCenter,
                                child: Text(widget.subtitle,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.inter(
                                      fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 12 : 15,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff7070FF)

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            StandardButton(
                                primaryColor: Colors.white,
                                secondaryColor: Color(0xff0000A3),
                                primaryTextColor: Color(0xff0000A3),
                                secondaryTextColor: Colors.white
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  widget.image,
                  width: double.maxFinite,
                  height: 400,
                  fit: widget.myFit,
                ),
              ),
            )
          ],
        ),
        //=====================================================================>
        replacement: Row(
          children: [
            Container(
              height: double.maxFinite,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 200,
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          widget.image,
                          width: double.maxFinite,
                          height: 400,
                          fit: widget.myFit,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: AnimatedSection(
                          unique: widget.uniqueText,
                          begin: Offset(0, 0.15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: double.maxFinite,
                                  alignment: Alignment.bottomCenter,
                                  child: Text(widget.title,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 20 : 28,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff0000A3)

                                    ),
                                  ),
                                ),
                              ),
                              //SizedBox(height: 10,),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  width: double.maxFinite,
                                  alignment: Alignment.topCenter,
                                  child: Text(widget.subtitle,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                        fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 12 : 15,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff7070FF)

                                    ),
                                  ),
                                ),
                              ),
                              StandardButton(
                                  primaryColor: Colors.white,
                                  secondaryColor: Color(0xff0000A3),
                                  primaryTextColor: Color(0xff0000A3),
                                  secondaryTextColor: Colors.white
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
