import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/newsHelpers/newsPage.dart';

class NewsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isHovered = false.obs;

    void onEntered(bool hovered) {
      isHovered.value = hovered;
    };
    return MouseRegion(
      onEnter: (event){
        onEntered(true);
      },
      onExit: (event) {
        onEntered(false);
      },
      child: GestureDetector(
        onTap: (){
          Get.to(()=>NewsPage());
        },
        child: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'images/categoryImage1.jpg',
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.fitWidth,
                      ),
                      Obx(
                          ()=> AnimatedOpacity(
                          duration: Duration(milliseconds: 500),
                          opacity: isHovered.value? 1.0 : 0.0,
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            color: Color(0xff0000A3).withOpacity(0.3),
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 35,
                              child: Icon(
                                  Icons.add,
                                size: 40,
                                weight: 5.5,
                              ),
                            ),
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
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('24.01.24',
                          style: GoogleFonts.inter(
                            letterSpacing: 2,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              height: 1.5
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text('But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.5
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //child: ProductTile(),
        ),
      ),
    );
  }
}
