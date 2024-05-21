import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  double get fetchController => animationController.value;

  @override
  void onInit() {
    // TODO: implement onInit
    animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}