import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/productHelpers/productPage.dart';

class ProductTile extends StatelessWidget {
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
          Get.to(()=>ProductPage());
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
                      Obx(
                            ()=> Visibility(
                          visible: !isHovered.value,
                          child: Image.asset(
                            'images/categoryImage1.jpg',
                            width: double.maxFinite,
                            height: double.maxFinite,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Obx(
                            ()=> Visibility(
                          visible: isHovered.value,
                          child: Image.asset(
                            'images/categoryImage2.jpg',
                            width: double.maxFinite,
                            height: double.maxFinite,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        bottom: 15,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset(
                            'icons/heart.svg',
                            height: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Floral print summer curtain\n₦34.99',
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.5
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
