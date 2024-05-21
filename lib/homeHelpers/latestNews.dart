import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 260,
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xff0000A3),
          ),
        ),
        Container(
          width: 256,
          height: 346,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff0000A3).withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    )
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(5),
                        child: Text('11-22-2023',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff7070FF)
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff0000A3)
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: (){},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Read More'),
                                Icon(Icons.arrow_forward)
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
      ],
    );
  }
}
