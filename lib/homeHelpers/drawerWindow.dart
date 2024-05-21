import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DrawerWindow extends StatelessWidget {
  const DrawerWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Center(
              child: SvgPicture.asset(
                'images/logo.svg',
                height: 80,
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Home'),
            ),
            onTap: () {
              Get.toNamed('/');
              //Get.back();
            },
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('About'),
            ),
            onTap: () {
              Get.toNamed('/about');
              //Get.back();
            },
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Shop'),
            ),
            onTap: () {
              Get.toNamed('/shop');
              //Get.back();
            },
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('Measuring Tool'),
            ),
            onTap: () {
              Get.toNamed('/measurement');
              //Get.back();
            },
          )
        ],
      ),
    );
  }
}
