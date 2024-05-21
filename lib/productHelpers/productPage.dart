import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/homeHelpers/appbarButton.dart';
import 'package:kelvic_technologies/homeHelpers/appbarTab.dart';
import 'package:kelvic_technologies/homeHelpers/bottomPane.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Container(
                  width: screenWidth * 0.9,
                  height: 100,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  top: BorderSide(
                                    color: Color(0xff0000A3).withOpacity(0.3),
                                    width: 1,
                                  )
                              )
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: double.maxFinite,
                                  padding: EdgeInsets.all(10),
                                  child: LogoButton(
                                    title: 'Kelvic\nTechnologies',
                                    image: 'icons/logo.webp',
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  height: 60,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AppBarTab(
                                        title: "Home",
                                        link: 0,
                                      ),
                                      AppBarTab(
                                        title: "About",
                                        link: 1,
                                      ),
                                      AppBarTab(
                                        title: "Products",
                                        link: 2,
                                      ),
                                      AppBarTab(
                                        title: "Services",
                                        link: 3,
                                      ),
                                      AppBarTab(
                                        title: "Blog",
                                        link: 4,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                        },
                                        child: CircleAvatar(
                                          child: SvgPicture.asset(
                                            'icons/person.svg',
                                            height: 17,
                                          ),
                                          radius: 20,
                                          backgroundColor: Color(0xff7070FF).withOpacity(0.1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                        },
                                        child: CircleAvatar(
                                          child: SvgPicture.asset(
                                            'icons/cart.svg',
                                            height: 17,
                                          ),
                                          radius: 20,
                                          backgroundColor: Color(0xff7070FF).withOpacity(0.1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Color(0xff0000A3).withOpacity(0.2)
                  )
                )
              ),
              child: TextButton(
                onPressed: (){
                  Get.back();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                        Icons.arrow_back_ios,
                      size: 15,
                    ),
                    Text(
                      'Back to results'
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 600,
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 550,
                            width: 70,
                            color: Colors.cyan,
                          ),
                          Container(
                            height: 550,
                            width: 400,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 400,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                              style: GoogleFonts.inter(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff0000A3)
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '₦ 30000',
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff0000A3)
                              ),
                            ),
                          ),
                          Container(
                            width: 400,
                            padding: EdgeInsets.all(10),
                            child: ExpansionTile(
                              backgroundColor: Colors.grey,
                              collapsedBackgroundColor: Color(0xffF7F7FF),
                              textColor: Colors.black,
                              iconColor: Colors.black,
                              title: Text(
                                  'Product Details',
                              ),
                              children: [
                                Container(
                                  color: Colors.black12,
                                  height: 300,
                                  width: 400,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 400,
                            padding: EdgeInsets.all(10),
                            child: ExpansionTile(
                              backgroundColor: Colors.grey,
                              collapsedBackgroundColor: Color(0xffF7F7FF),
                              textColor: Colors.black,
                              iconColor: Colors.black,
                              title: Text(
                                'Brand',
                              ),
                              children: [
                                Container(
                                  color: Colors.black12,
                                  height: 300,
                                  width: 400,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: BottomPane(),
          )
        ],
      ),
    );
  }
}
