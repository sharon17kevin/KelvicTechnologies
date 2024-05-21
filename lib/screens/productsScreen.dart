import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/homeHelpers/appbarButton.dart';
import 'package:kelvic_technologies/homeHelpers/appbarTab.dart';
import 'package:kelvic_technologies/productHelpers/productTile.dart';
import 'package:kelvic_technologies/productHelpers/sortTab.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_framework.dart' as ResponsiveConditions show Condition;

import '../homeHelpers/bottomPane.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: MySliverPersistentHeaderDelegate(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60,
              alignment: Alignment.center,
              child: Text('200 styles found',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 100),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ProductTile();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 60,
              alignment: Alignment.center,
              child: Text('12 out of 670',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: InkWell(
                splashColor: Color(0xff7070FF),
                hoverColor: Color(0xffD6D6FF),//Color(0xffFFC675),
                onTap: (){

                },
                child: Ink(
                  height: 60,
                  width: 180,
                  color: Color(0xffF7F7FF),
                  child: Center(
                    child: Text('Load More',
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: BottomPane(),
            ),
          )
        ],
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    var curtainClicked = false.obs;
    var sheetClicked = false.obs;
    var pillowClicked = false.obs;
    var accessClicked = false.obs;
    var duvetClicked = false.obs;
    var foamClicked = false.obs;
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
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
                              alignment: Alignment.centerLeft,
                              child: LogoButton(
                                title: 'Kelvic\nTechnologies',
                                image: 'icons/logo.webp',
                              ),
                            ),
                          ),
                          ResponsiveVisibility(
                            visible: true,
                            hiddenConditions: [
                              ResponsiveConditions.Condition.smallerThan(
                                name : 'ADJUST_PRODUCT',
                                value: false,
                              )
                            ],
                            replacement: Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              child: Builder(
                                  builder: (context) {
                                    return IconButton(
                                      icon: Icon(Icons.menu_rounded,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                      onPressed: (){
                                        Scaffold.of(context).openDrawer();
                                      },
                                    );
                                  }
                              ),
                            ),
                            child: Expanded(
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
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                    },
                                    child: CircleAvatar(
                                      child: SvgPicture.asset(
                                        'icons/person.svg',
                                        height: 15,
                                      ),
                                      radius: 15,
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
                                        height: 15,
                                      ),
                                      radius: 15,
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
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          color: Color(0xffF7F7FF),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SortTab(),
                  SortTab(),
                  SortTab(),
                  SortTab(),
                  SortTab(),
                  SortTab(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 230.0;

  @override
  double get minExtent => 230.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
