import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kelvic_technologies/homeHelpers/appbarButton.dart';
import 'package:kelvic_technologies/homeHelpers/appbarTab.dart';

class NewsPage extends StatelessWidget {
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
              height: 480,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/about.jpg',
                    width: double.maxFinite,
                    fit: BoxFit.fitWidth,
                    color: Color(0xff00000A),
                    colorBlendMode: BlendMode.softLight,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
