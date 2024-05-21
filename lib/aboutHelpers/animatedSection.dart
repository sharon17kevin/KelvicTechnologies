import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedSection extends StatefulWidget {
  final String unique;
  final Offset begin;
  final Widget child;

  AnimatedSection({
    required this.unique,
    required this.begin,
    required this.child
  });
  @override
  _AnimatedSectionState createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastEaseInToSlowEaseOut);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VisibilityDetector(
        key: Key(widget.unique),
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.visibleFraction > 0.4) {
            _controller.forward();
          }
        },
        child: SlideTransition(
          position: Tween<Offset> (
            begin: widget.begin,
            end: Offset.zero
          ).animate(_controller),
          child: FadeTransition(
            opacity: _animation,
            child: widget.child
            ),
        ),
      ),
    );
  }
}
