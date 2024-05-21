import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../homeHelpers/serviceInfo.dart';

class UserController extends GetxController{
  RxInt activeService = 0.obs;
  var serviceInfoList = [
    ServiceInfo(
      title: "Telecommunication",
      content: "Robust network coverage and cutting-edge technologies ensuring seamless connectivity across regions.\n\nTailored enterprise services and customizable solutions for specific business communication requirements.\n\nShowcasing success stories and positive feedback from satisfied users and clients.\n\nStringent data security measures and compliance with industry standards ensuring user privacy.\n",
      page: Placeholder(),
    ),
    ServiceInfo(
      title: "Batteries",
      content: "Robust network coverage and cutting-edge technologies ensuring seamless connectivity across regions.\n\nTailored enterprise services and customizable solutions for specific business communication requirements.\n\nShowcasing success stories and positive feedback from satisfied users and clients.\n\nStringent data security measures and compliance with industry standards ensuring user privacy.\n",
      page: Placeholder(),
    ),
    ServiceInfo(
      title: "Energy Auditing",
      content: "Robust network coverage and cutting-edge technologies ensuring seamless connectivity across regions.\n\nTailored enterprise services and customizable solutions for specific business communication requirements.\n\nShowcasing success stories and positive feedback from satisfied users and clients.\n\nStringent data security measures and compliance with industry standards ensuring user privacy.\n",
      page: Placeholder(),
    ),
    ServiceInfo(
      title: "Solar Energy",
      content: "Robust network coverage and cutting-edge technologies ensuring seamless connectivity across regions.\n\nTailored enterprise services and customizable solutions for specific business communication requirements.\n\nShowcasing success stories and positive feedback from satisfied users and clients.\n\nStringent data security measures and compliance with industry standards ensuring user privacy.\n",
      page: Placeholder(),
    )
  ].obs;

  void setService(int index) {
    activeService.value = index;
  }
}