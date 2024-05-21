import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kelvic_technologies/controllers/animatedSlideController.dart';
import 'package:kelvic_technologies/controllers/myAnimationController.dart';

class HomeSlide extends StatefulWidget {
  final List<String> images;

  HomeSlide({required this.images});
  @override
  _HomeSlideState createState() => _HomeSlideState();
}

class _HomeSlideState extends State<HomeSlide> with TickerProviderStateMixin{
  final AnimatedSlideController animatedSlideController = Get.put(AnimatedSlideController());
  late int counter;
  late Widget animatedSlider;
  late var _slides;
  final MyAnimationController _animationController = Get.put(MyAnimationController());
  @override
  void initState() {
    // TODO: implement initState
    _slides = animatedSlideController.getSlides;
    Timer.periodic(
        Duration(seconds: 1),
            (timer) {
          setState(() {
            counter = animatedSlideController.counter;
            animatedSlider = _slides[counter];
          });
        }
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    counter = animatedSlideController.counter;
    final List<Widget> _slides = animatedSlideController.getSlides;
    animatedSlider = _slides[counter];
    return Container(
      height: 630,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 600,
            width: screenWidth * 0.9,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 1000),
              child: animatedSlider,
              switchInCurve: Curves.easeInOutCubic,
              switchOutCurve: Curves.easeInOutCubic,
            ),
          ),
          Container(
            height: 600,
            width: screenWidth * 0.9,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 50,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      if (counter > 0) {
                        setState(() {
                          animatedSlideController.decrement();
                          counter--;
                          animatedSlider = _slides[counter];
                          //_animationController.animationController.reset();
                          _animationController.animationController.forward();
                      });
                      } else {
                        setState(() {
                          animatedSlideController.assignMax();
                          counter = _slides.length - 1;
                          animatedSlider = _slides[counter];
                          //_animationController.animationController.reset();
                          _animationController.animationController.forward();
                        });
                      }
                     }
,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff7070FF).withOpacity(0.25),
                      child: SvgPicture.asset(
                        'icons/arrow_up.svg',
                        height: 8,
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),
                  TextButton(
                    onPressed: (){
                      if(counter < _slides.length - 1) {
                        setState(() {
                          animatedSlideController.increment();
                          counter++;
                          animatedSlider = _slides[counter];
                          //_animationController.animationController.reset();
                          _animationController.animationController.forward();
                        });
                      } else {
                        setState(() {
                          animatedSlideController.assignMin();
                          counter = 0;
                          animatedSlider = _slides[counter];
                          //_animationController.animationController.reset();
                          _animationController.animationController.forward();
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xff7070FF).withOpacity(0.25),
                      child: SvgPicture.asset(
                        'icons/arrow_down.svg',
                        height: 8,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 7,
                    width: 7,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: counter == 0? Color(0xff0000A3) : Color(0xffD6D6FF)
                    ),
                  ),
                  Container(
                    height: 7,
                    width: 7,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: counter == 1? Color(0xff0000A3) : Color(0xffD6D6FF)
                    ),
                  ),
                  Container(
                    height: 7,
                    width: 7,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: counter == 2? Color(0xff0000A3) : Color(0xffD6D6FF)
                    ),
                  ),
                  Container(
                    height: 7,
                    width: 7,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: counter == 3? Color(0xff0000A3) : Color(0xffD6D6FF)
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
