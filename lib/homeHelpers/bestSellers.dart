import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BestSellers extends StatefulWidget {
  final String image;

  BestSellers({required this.image});
  @override
  _BestSellersState createState() => _BestSellersState();
}

class _BestSellersState extends State<BestSellers> {
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
      child: ClipRect(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          //color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                widget.image,
                //width: double.maxFinite,
                height: double.maxFinite,
                //width: double.maxFinite,
                fit: BoxFit.fitHeight,
              ),
              Visibility(
                visible: isHovered,
                child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: Colors.black38,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "icons/arrowurdw.svg",
                    height: 20,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 10,
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xffF7F7FF),
                  height: 15,
                  width: 50,
                  child: Text("Hot",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0000A3)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
