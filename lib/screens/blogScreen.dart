import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/homeHelpers/appbarButton.dart';
import 'package:kelvic_technologies/homeHelpers/appbarTab.dart';
import 'package:kelvic_technologies/homeHelpers/bottomPane.dart';
import 'package:kelvic_technologies/newsHelpers/newsTile.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_framework.dart' as ResponsiveConditions show Condition;

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
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
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                bottom: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? 30 : 80,
              ),
              height: 480,
              color: Colors.blue.withOpacity(0.4),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/about.jpg',
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                    color: Colors.blue.withOpacity(0.6),//Color(0xff00000A),
                    colorBlendMode: BlendMode.multiply,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    margin: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Colors.white.withOpacity(0.6)
                        )
                    ),
                  ),
                  Text(
                    'Stay Up-To-Date With Our Latest\n News And Events',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 25 : 35,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(100),
              alignment: Alignment.center,
              child: Column(
                children: [
                  ResponsiveRowColumn(
                    rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                    columnMainAxisSize: MainAxisSize.min,
                    columnCrossAxisAlignment: CrossAxisAlignment.center,
                    columnSpacing: 10,
                    rowSpacing: 5,
                    rowPadding: const EdgeInsets.all(0),
                    columnPadding: const EdgeInsets.all(10),
                    layout: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    children: [
                      ResponsiveRowColumnItem(
                        child: Text(
                          "News & Events",
                          style: GoogleFonts.inter(
                            fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 20 : 35,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Colors.grey
                          ),
                          
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? Alignment.center : Alignment.centerLeft,
                    child: Text('Sorted by date')
                  )
                ],
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
                  maxCrossAxisExtent: 550,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return NewsTile();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: BottomPane(),
            ),
          )
        ],
      ),
    );
  }
}
