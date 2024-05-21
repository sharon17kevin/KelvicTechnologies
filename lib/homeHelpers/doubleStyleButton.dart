import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoubleStyleButton extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final String text;

  DoubleStyleButton({required this.primaryColor, required this.secondaryColor, required this.text});
  @override
  State<DoubleStyleButton> createState() => _DoubleStyleButtonState();
}

class _DoubleStyleButtonState extends State<DoubleStyleButton> {
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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 140,
            height: 50,
            color: widget.primaryColor,
            alignment: Alignment.center,
            child: Text(widget.text,
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
          Positioned(
            bottom: -8,
            right: -8,
            child: Container(
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: widget.secondaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
