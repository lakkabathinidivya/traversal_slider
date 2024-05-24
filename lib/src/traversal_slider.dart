import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:traversal_slider/src/curved_carousel.dart';
import 'package:traversal_slider/src/slider_enum.dart';

class TraversalSlider extends StatefulWidget {
  /// pass list of widgets to animate
  final List<Widget> widgets;

  /// use to change the slidertype.
  final SliderType sliderType;

  /// returns index of current visible widget
  final Function(int) onIndexChanged;

  const TraversalSlider({
    super.key,
    required this.widgets,
    required this.onIndexChanged,
    this.sliderType = SliderType.bottomSlider,
  });

  @override
  State<TraversalSlider> createState() => _TraversalSliderState();
}

class _TraversalSliderState extends State<TraversalSlider>
    with SingleTickerProviderStateMixin {
  double _turns = 0.0;
  double _rotationAngle = 0.0;
  late AnimationController controller;
  var isClicked = false;
  int currentIndex = 1;
  late Timer _timer;

  _startTimer() {
    _timer = Timer(const Duration(milliseconds: 1000), () => isClicked = false);
  }

  void rotateAndDisplayNextImage({int? index}) {
    if (isClicked == false) {
      _startTimer();
      isClicked = true;
      // Your other code which you want to execute on click.

      if (widget.sliderType == SliderType.bottomSlider) {
        setState(() {
          _turns += 1;
          print('prints --$_turns');

          // Rotate by 90 degrees
          //controller.forward(from: );
        });

        // Delay displaying the next image until the rotation animation is complete
        Future.delayed(controller.duration!, () {
          setState(() {
            currentIndex = (currentIndex + 1) % widget.widgets.length;
            _rotationAngle = 10; // Reset rotation angle
          });
        });
      }
    } else {
      currentIndex = index ?? 0;
      //setState(() {});
    }

    widget.onIndexChanged(currentIndex);
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,

      duration: const Duration(
          milliseconds: 1000), // Adjust animation duration as needed
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.sliderType == SliderType.centerSlider
        ? Transform.rotate(
            alignment: Alignment.centerRight,
            angle: math.pi / 2,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.transparent,
                height: 300,
                width: double.infinity,
                child: CurvedCarousel(
                  viewPortSize: 1 / 6,
                  getInitialIndex: (index) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (timeStamp) {
                        rotateAndDisplayNextImage(index: index);
                      },
                    );
                  },
                  curveScale: 100,
                  horizontalPadding: 0.4,
                  middleItemScaleRatio: 2.5,
                  onChangeStart: (index, reason) {
                    rotateAndDisplayNextImage(index: index);
                  },
                  itemBuilder: (_, i) {
                    return Transform.rotate(
                        angle: 4.8,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: SizedBox(
                                height: 80, child: widget.widgets[i])));
                  },
                  itemCount: widget.widgets.length,
                ),
              ),
            ),
          )
        : Container(
            alignment: Alignment.bottomRight,
            child: AnimatedRotation(
              alignment: Alignment.bottomCenter,
              turns: _turns,
              duration: const Duration(seconds: 1),
              child: InkWell(
                onTap: rotateAndDisplayNextImage,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return AnimatedRotation(
                            alignment: Alignment.bottomCenter,
                            turns: _turns,
                            duration: const Duration(seconds: 1),
                            child: SizedBox(
                                height: 400,
                                child: widget.widgets[currentIndex]));
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
