import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/aboutHelpers/animatedSection.dart';
import 'package:kelvic_technologies/homeHelpers/appbarButton.dart';
import 'package:kelvic_technologies/homeHelpers/bottomPane.dart';
import 'package:kelvic_technologies/homeHelpers/drawerWindow.dart';
import 'package:kelvic_technologies/homeHelpers/standardButton.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_framework.dart' as ResponsiveConditions show Condition;

import '../homeHelpers/appbarTab.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWindow(),
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
                    'Connecting Communities\nAnd Powering Sustainability.',
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
              margin: EdgeInsets.only(top: 25, bottom: 100),
              height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 620 : 500,
              alignment: Alignment.center,
              child: ResponsiveRowColumn(
                rowMainAxisAlignment: MainAxisAlignment.center,
                columnCrossAxisAlignment: CrossAxisAlignment.center,
                columnSpacing: 10,
                rowSpacing: 5,
                rowPadding: const EdgeInsets.all(30),
                columnPadding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                layout: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 370 : 500,
                            height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 250 : 350,
                            decoration: BoxDecoration(
                              color: Color(0xff7070FF).withOpacity(0.2),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                          ),
                          Positioned(
                            top: -20,
                            right: -20,
                            child: AnimatedSection(
                              unique: 'first-section-image',
                              begin: Offset(-0.25, 0),
                              child: Image.asset(
                                'images/slide2.jpg',
                                width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 370 : 500,
                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 250 : 350,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 4,
                    child: Container(
                      alignment: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? Alignment.center : Alignment.centerLeft,
                      child: AnimatedSection(
                        unique: 'first-section-text',
                        begin: Offset(0.25, 0),
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          width: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? screenWidth * 0.8 : screenWidth * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text('Providing Efficient And Sustainable Solutions.',
                                  style: GoogleFonts.inter(
                                      fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 20 : 29 : 37,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff0000A3)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text('Efficiency Redefined: At Kelvic Technology, we redefine efficiency through our advanced telecommunication solutions, ensuring optimal connectivity and communication for businesses and individuals alike.',
                                  style: GoogleFonts.inter(
                                      fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 13 : 15 : 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text('Green Solutions, Brighter Tomorrow: With a focus on sustainability, our energy solutions pave the path to a brighter tomorrow. Join us in embracing green alternatives for a cleaner and more energy-efficient world.',
                                  style: GoogleFonts.inter(
                                      fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 13 : 15 : 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: StandardButton(
                                  primaryColor: Color(0xff0000A3),
                                  secondaryColor: Color(0xff7070FF).withOpacity(0.2),
                                  primaryTextColor: Colors.white,
                                  secondaryTextColor: Color(0xff0000A3),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 100),
                padding: EdgeInsets.symmetric(horizontal: 100),
                width: screenWidth * 0.87,
                height: 350,
                color: Color(0xff0000A3),
                child: AnimatedSection(
                  unique: 'second-section',
                  begin: Offset(0, 0.15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mission Statement',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? 15 : 20,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text('\"Empowering Connectivity, Sustaining Tomorrow: Our mission at Kelvic Technologies is to revolutionize telecommunications with cutting-edge solutions, fostering seamless connections. Committed to environmental responsibility, we strive to lead the charge in sustainable energy, ensuring a cleaner and brighter future for all.\"',
                          style: GoogleFonts.sortsMillGoudy(
                              color: Colors.white,
                              fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? ResponsiveBreakpoints.of(context).smallerThan(TABLET)? 15 : 19 : 24,
                              fontWeight: FontWeight.w300
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
              margin: EdgeInsets.only(top: 25, bottom: 100),
              height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 620 : 500,
              alignment: Alignment.center,
              child: ResponsiveRowColumn(
                rowMainAxisAlignment: MainAxisAlignment.center,
                columnCrossAxisAlignment: CrossAxisAlignment.center,
                columnSpacing: 10,
                rowSpacing: 5,
                rowPadding: const EdgeInsets.all(30),
                columnPadding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                layout: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 370 : 500,
                            height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 250 : 350,
                            decoration: BoxDecoration(
                                color: Color(0xff7070FF).withOpacity(0.2),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                          ),
                          Positioned(
                            top: -20,
                            right: -20,
                            child: AnimatedSection(
                              unique: 'third-section-image',
                              begin: Offset(-0.25, 0),
                              child: Image.asset(
                                'images/slide2.jpg',
                                width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 370 : 500,
                                height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 250 : 350,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 4,
                    child: Container(
                      alignment: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? Alignment.center : Alignment.centerLeft,
                      child: AnimatedSection(
                        unique: 'third-section-text',
                        begin: Offset(0.25, 0),
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          width: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? screenWidth * 0.8 : screenWidth * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text('Innovative And Adaptive.',
                                  style: GoogleFonts.inter(
                                      fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 20 : 29 : 37,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff0000A3)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text('At Kelvic Technologies, we thrive on innovation and adaptability. Our cutting-edge solutions are designed to evolve with the dynamic needs of the telecommunications and sustainable energy landscapes. From groundbreaking technologies to forward-thinking strategies, we lead the way in creating solutions that not only meet the present challenges but anticipate the future. Experience the power of innovation and adaptability with us as we redefine possibilities in connectivity and sustainability.',
                                  style: GoogleFonts.inter(
                                      fontSize: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 13 : 15 : 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: StandardButton(
                                  primaryColor: Color(0xff0000A3),
                                  secondaryColor: Color(0xff7070FF).withOpacity(0.2),
                                  primaryTextColor: Colors.white,
                                  secondaryTextColor: Color(0xff0000A3),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                width: screenWidth * 0.87,
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 50),
                      child: Text("Our Partners",
                        style: GoogleFonts.inter(
                            fontSize: 35,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff0000A3)
                        ),
                      ),
                    ),
                    AnimatedSection(
                      unique: 'fourth-section',
                      begin: Offset(0, 0.15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            color: Color(0xff0000A3),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Color(0xff0000A3),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Color(0xff0000A3),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            color: Color(0xff0000A3),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(80),
                width: screenWidth * 0.87,
                height: 350,
                color: Color(0xff0000A3),
                child: AnimatedSection(
                  unique: 'fifth-section',
                  begin: Offset(0, 0.15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text('Curious about optimizing your energy efficiency or connecting your company\'s sites?',
                            style: GoogleFonts.inter(
                                fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 20 : 30 : 38,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                            ),
                            maxLines: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 6 : 3,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: StandardButton(
                              primaryColor: Colors.white,
                              secondaryColor: Color(0xffD6D6FF),
                              primaryTextColor: Color(0xff0000A3),
                              secondaryTextColor: Color(0xff0000A3),
                            ),
                          )
                          ,
                        ),
                      )
                    ],
                  ),
                ),
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
