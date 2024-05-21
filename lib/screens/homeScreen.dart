import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelvic_technologies/controllers/userController.dart';
import 'package:kelvic_technologies/homeHelpers/appbarButton.dart';
import 'package:kelvic_technologies/homeHelpers/appbarTab.dart';
import 'package:kelvic_technologies/homeHelpers/bestSellers.dart';
import 'package:kelvic_technologies/homeHelpers/drawerWindow.dart';
import 'package:kelvic_technologies/homeHelpers/latestNews.dart';
import 'package:kelvic_technologies/homeHelpers/bottomPane.dart';
import 'package:kelvic_technologies/homeHelpers/doubleStyleButton.dart';
import 'package:kelvic_technologies/homeHelpers/homeSlide.dart';
import 'package:kelvic_technologies/homeHelpers/serviceInfo.dart';
import 'package:kelvic_technologies/homeHelpers/serviceTab.dart';
import 'package:kelvic_technologies/homeHelpers/standardButton.dart';
import 'package:responsive_framework/responsive_framework.dart' as ResponsiveConditions show Condition;
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController bestSellerController = CarouselController();
  CarouselController latestNewsController = CarouselController();
  UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerWindow(),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 650,
            child: Image.asset(
              'images/backdrop.webp',
              height: 650,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      width: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? double.maxFinite : screenWidth * 0.85,
                      height: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 115 : 140,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    height: double.maxFinite,
                                    alignment: Alignment.center,
                                    child: AppBarButton(
                                      title: 'Account',
                                      image: 'icons/person.svg',
                                    ),
                                  ),
                                  ResponsiveVisibility(
                                    visible: true,
                                    hiddenConditions: [
                                      ResponsiveConditions.Condition.smallerThan(
                                        name : TABLET,
                                        value: false,
                                      )
                                    ],
                                    replacement: SizedBox(),
                                    child: Container(
                                      width: 300,
                                      height: double.maxFinite,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AppBarButton(
                                            title: '07014550015',
                                            image: 'icons/phone.svg',
                                          ),
                                        AppBarButton(
                                          title: 'Sign up | Login',
                                          image: 'icons/logIn.svg',
                                        ),

                                      ],
                                    ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
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
                                children: [
                                  Container(
                                    width: 200,
                                    height: double.maxFinite,
                                    alignment: Alignment.centerLeft,
                                    child: LogoButton(
                                      title: 'Kelvic\nTechnologies',
                                      image: 'icons/logo.webp',
                                    ),
                                  ),
                                  ResponsiveVisibility(
                                    visible: true,
                                    hiddenConditions: [
                                      ResponsiveConditions.Condition.smallerThan(
                                        name : 'ADJUST_APPBAR',
                                        value: false,
                                      )
                                    ],
                                    replacement: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    ),
                                    child: Expanded(
                                      flex: 4,
                                      child: Container(
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
                                      padding: EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                            },
                                            child: CircleAvatar(
                                              child: SvgPicture.asset(
                                                'icons/search.svg',
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
                  height: 500,
                  color: Colors.transparent,
                  child: Container(
                    width: screenWidth * 0.9,
                    //margin: EdgeInsets.only(bottom: 20),
                    height: 500,
                    child: HomeSlide(
                      images: [
                        "images/dad_landing.webp",
                        "slides/dad_landing.webp",
                        "slides/dad_landing.webp",
                        "slides/dad_landing.webp"
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          'What Services Do We Offer?',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            color: Color(0xff0000A3)
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_APPBAR')? 150 : 250,
                        child: Row(
                          children: [
                            Expanded(
                              child: ServiceTab(
                                image: 'images/mast.webp',
                                title: 'Telecom',
                                link: 0,
                              ),
                            ),
                            Expanded(
                              child: ServiceTab(
                                image: 'images/battery.webp',
                                title: 'Batteries',
                                link: 1,
                              ),
                            ),
                            Expanded(
                              child: ServiceTab(
                                image: 'images/meter.webp',
                                title: 'Auditing',
                                link: 2,
                              ),
                            ),
                            Expanded(
                              child: ServiceTab(
                                image: 'images/solar.webp',
                                title: 'Solar',
                                link: 3,
                              ),
                            )
                          ],
                        ),
                      ),
                      Obx(
                          ()=> _userController.serviceInfoList[_userController.activeService.value]
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xffF7F7FF),
                  height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? 630 : 480,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Why Choose Kelvic Tech",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Color(0xff0000A3)
                          ),
                        ),
                      ),
                      Container(
                        height: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? 550 : 420,
                        child: ResponsiveVisibility(
                          visible: true,
                          hiddenConditions: [
                            ResponsiveConditions.Condition.smallerThan(
                              name : 'ADJUST_PRODUCT',
                              value: false,
                            )
                          ],
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width: 420,
                                        height: 350,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 20),
                                        height: 350,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                              'images/construction.jpg',
                                            )
                                          ),
                                          color: Colors.lightBlueAccent,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(120),
                                            topRight: Radius.circular(4),
                                            bottomLeft: Radius.circular(4),
                                            bottomRight: Radius.circular(4)
                                          )
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 50,
                                        right: 0,
                                        child: DoubleStyleButton(
                                          primaryColor: Color(0xff0000A3),
                                          secondaryColor: Color(0xffD6D6FF),
                                          text: "More",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('About our Company',
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          color: Color(0xff7070FF),
                                          fontWeight: FontWeight.w200
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      RichText(
                                        text: TextSpan(
                                          text: 'We build more ',
                                          style: GoogleFonts.inter(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black
                                          ),
                                          children: const <TextSpan>[
                                            TextSpan(text: 'competitive\n',
                                                style: TextStyle(color: Color(0xff0A0AFF))
                                            ),
                                            TextSpan(text: 'telecommunication infrastructure'),
                                          ],
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        width: Get.width * 0.38,
                                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                          style: GoogleFonts.inter(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black
                                          ),
                                          maxLines: 7,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        width: Get.width * 0.38,
                                        height: 100,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 10
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xff7070FF).withOpacity(0.2),
                                          border: Border(
                                            left: BorderSide(
                                              width: 5,
                                              color: Color(0xff7070FF)
                                            )
                                          )
                                        ),
                                        alignment: Alignment.center,
                                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                                          style: GoogleFonts.inter(
                                              fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 14 : 18,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          replacement: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: 380,
                                          height: 300,
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(vertical: 20),
                                          height: 280,
                                          width: 320,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: ExactAssetImage(
                                                    'images/construction.jpg',
                                                  ),
                                                fit: BoxFit.fitWidth
                                              ),
                                              color: Colors.lightBlueAccent,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(90),
                                                  topRight: Radius.circular(4),
                                                  bottomLeft: Radius.circular(4),
                                                  bottomRight: Radius.circular(4)
                                              )
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 50,
                                          right: 0,
                                          child: DoubleStyleButton(
                                            primaryColor: Color(0xff0000A3),
                                            secondaryColor: Color(0xffD6D6FF),
                                            text: "More",
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: ResponsiveRowColumn(
                                    rowMainAxisAlignment: MainAxisAlignment.center,
                                    columnCrossAxisAlignment: CrossAxisAlignment.center,
                                    columnSpacing: 10,
                                    rowSpacing: 5,
                                    rowPadding: const EdgeInsets.all(30),
                                    columnPadding: const EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
                                    layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                                        ? ResponsiveRowColumnType.COLUMN
                                        : ResponsiveRowColumnType.ROW,
                                    children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: 1,
                                        columnFlex: 3,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('About our Company',
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.inter(
                                                  fontSize: 11,
                                                  color: Color(0xff7070FF),
                                                  fontWeight: FontWeight.w200
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            RichText(
                                              text: TextSpan(
                                                text: 'We build more ',
                                                style: GoogleFonts.inter(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black
                                                ),
                                                children: const <TextSpan>[
                                                  TextSpan(text: 'competitive\n',
                                                      style: TextStyle(color: Color(0xff0A0AFF))
                                                  ),
                                                  TextSpan(text: 'telecommunication infrastructure'),
                                                ],
                                              ),
                                              textAlign: TextAlign.left,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                              width: double.maxFinite,
                                              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                                style: GoogleFonts.inter(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black
                                                ),
                                                maxLines: ResponsiveBreakpoints.of(context).smallerThan(TABLET)? 4 : 6,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                       ResponsiveRowColumnItem(
                                         rowFlex: 1,
                                         columnFlex: 1,
                                         child: Container(
                                           width: double.maxFinite,
                                           child: Container(
                                             width: double.maxFinite,
                                             height: 100,
                                             padding: EdgeInsets.symmetric(
                                                 horizontal: 20,
                                                 vertical: 10
                                             ),
                                             decoration: BoxDecoration(
                                                 color: Color(0xff7070FF).withOpacity(0.2),
                                                 border: Border(
                                                     left: BorderSide(
                                                         width: 5,
                                                         color: Color(0xff7070FF)
                                                     )
                                                 )
                                             ),
                                             alignment: Alignment.center,
                                             child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                                               style: GoogleFonts.inter(
                                                   fontSize: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)? 14 : 18,
                                                   fontWeight: FontWeight.w300,
                                                   color: Colors.black
                                               ),
                                               maxLines: 3,
                                               overflow: TextOverflow.ellipsis,
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Best Sellers",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Color(0xff0000A3)
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    bestSellerController.previousPage();
                                  },
                                  child: CircleAvatar(
                                    child: SvgPicture.asset(
                                      'icons/arrow_left.svg',
                                      height: 17,
                                    ),
                                    radius: 20,
                                    backgroundColor: Color(0xff7070FF).withOpacity(0.1),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Container(
                                child: Column(
                                  children: [
                                    CarouselSlider.builder(
                                      carouselController: bestSellerController,
                                        itemCount: 7,
                                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                          return Container(
                                            width: 350,
                                            height: 350,
                                            color: Color(0xff7070FF).withOpacity(0.2),
                                            child: BestSellers(
                                              image: 'images/construction.jpg',
                                            ),
                                          );
                                        },
                                        options: CarouselOptions(
                                          height: 350,
                                          enlargeCenterPage: false,
                                          autoPlay: true,
                                          aspectRatio: 16 / 9,
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enableInfiniteScroll: true,
                                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                                          viewportFraction: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? 1 : 0.5,
                                        ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      width: double.maxFinite,
                                      alignment: Alignment.centerRight,
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
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    bestSellerController.nextPage();
                                  },
                                  child: CircleAvatar(
                                    child: SvgPicture.asset(
                                      'icons/arrow_right.svg',
                                      height: 17,
                                    ),
                                    radius: 20,
                                    backgroundColor: Color(0xff7070FF).withOpacity(0.1),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xffF7F7FF),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text("Latest News",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Color(0xff0000A3)
                          ),
                        ),
                      ),
                      Container(
                        width: Get.width * 0.6,
                        padding: const EdgeInsets.all(15),
                        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing ealit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Color(0xff00003D)
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: (){
                                    latestNewsController.previousPage();
                                  },
                                  child: CircleAvatar(
                                    child: SvgPicture.asset(
                                      'icons/arrow_left.svg',
                                      height: 17,
                                    ),
                                    radius: 20,
                                    backgroundColor: Color(0xff7070FF).withOpacity(0.1),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Container(
                                child: Column(
                                  children: [
                                    CarouselSlider.builder(
                                      carouselController: latestNewsController,
                                      itemCount: 7,
                                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                                        return LatestNews();
                                      },
                                      options: CarouselOptions(
                                        height: 350,
                                        enlargeCenterPage: false,
                                        autoPlay: false,
                                        aspectRatio: 16 / 9,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enableInfiniteScroll: true,
                                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                                        viewportFraction: ResponsiveBreakpoints.of(context).smallerThan('ADJUST_PRODUCT')? 0.8 : 0.35,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      width: double.maxFinite,
                                      alignment: Alignment.centerRight,
                                      child: StandardButton(
                                        primaryColor: Color(0xff0000A3),
                                        secondaryColor: Color(0xff7070FF).withOpacity(0.2),
                                        primaryTextColor: Colors.white,
                                        secondaryTextColor: Color(0xff0000A3),
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    latestNewsController.nextPage();
                                  },
                                  child: CircleAvatar(
                                    child: SvgPicture.asset(
                                      'icons/arrow_right.svg',
                                      height: 17,
                                    ),
                                    radius: 20,
                                    backgroundColor: Color(0xff7070FF).withOpacity(0.1),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: BottomPane(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
