import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kelvic_technologies/homeHelpers/animatedSlider.dart';

class AnimatedSlideController extends GetxController{

  var _slides = [
    AnimatedSlider(
      image: "images/dad_landing.webp",
      title: 'Integrated Solutions for Power & Connectivity',
      subtitle: 'Empowering Your World with Sustainable Energy and Seamless Communication',
      unique: 0,
      uniqueText: '0-text',
      myFit: BoxFit.fitWidth,
      key: ValueKey(0),
    ),
    AnimatedSlider(
      image: "images/dad_land_energy.webp",
      title: "ELEGANT BEAUTY UNFOLDED",
      subtitle: "Crafting Enchantment for Your Home's Most Delightful Moments",
      unique: 1,
      uniqueText: '1-text',
      myFit: BoxFit.fitHeight,
      key: ValueKey(1),
    ),
    AnimatedSlider(
      image: "images/dad_land_audit.webp",
      title: "ELEVATE YOUR VIEW TODAY",
      subtitle: "Creating Timeless Spaces through Artful Drapery",
      unique: 2,
      uniqueText: '2-text',
      myFit: BoxFit.contain,
      key: ValueKey(2),
    ),
    AnimatedSlider(
      image: "images/dad_landing.webp",
      title: "COMFORT AND STYLE",
      subtitle: "Elevating Interiors, One Exquisite Fold at a Time",
      unique: 3,
      uniqueText: '3-text',
      myFit: BoxFit.fitWidth,
      key: ValueKey(3),
    ),
  ].obs;
  var count = 0.obs;

  List<AnimatedSlider> get getSlides => _slides.value;
  int get counter => count.value;

  void increment() {
    count.value = count.value + 1;
  }

  void decrement() {
    count.value = count.value - 1;
  }

  void assignMin() {
    count.value = 0;
  }

  void assignMax() {
    count.value = 3;
  }

  void goToNextPage() {
    if (count < 3) {
      increment();
    } else {
      assignMin();
    }
  }
}