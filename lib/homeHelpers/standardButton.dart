import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StandardButton extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  StandardButton({required this.primaryColor, required this.secondaryColor, required this.primaryTextColor, required this.secondaryTextColor});
  @override
  _StandardButtonState createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> with SingleTickerProviderStateMixin{
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
      child: Container(
        width: 140,
        height: 50,
        alignment: Alignment.center,
        color: isHovered? widget.secondaryColor : widget.primaryColor,
        child: Text(
          'More',
          style: GoogleFonts.inter(
              fontSize: 18,
              color: isHovered? widget.secondaryTextColor : widget.primaryTextColor,
              fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}
