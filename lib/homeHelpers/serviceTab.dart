import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/controllers/userController.dart';
import 'package:responsive_framework/responsive_framework.dart' as ResponsiveConditions show Condition;
import 'package:responsive_framework/responsive_framework.dart';

class ServiceTab extends StatefulWidget {
  final String image;
  final String title;
  final int link;

  ServiceTab({required this.image, required this.title, required this.link});

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  UserController _userController = Get.find<UserController>();
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
      cursor: isHovered ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: (){
          _userController.setService(widget.link);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(
              ()=> Container(
                color: _userController.activeService.value == widget.link? Colors.white : Color(0xffF7F7FF),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      transform: Matrix4.identity()..scale(isHovered? 1.1 : 1.0),
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        widget.image,
                        height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 60 : 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(widget.title,
                      style: GoogleFonts.inter(
                          color: Color(0xff0000A3),
                          fontSize: 15
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide(
                          color: Colors.white,
                          width: 1.5
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}