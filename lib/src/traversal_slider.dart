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
    this.sliderType = SliderType.multipleViewSlider,
  });

  @override
  State<TraversalSlider> createState() => _TraversalSliderState();
}

class _TraversalSliderState extends State<TraversalSlider>
    with SingleTickerProviderStateMixin {
  double _turns = 0.0;
  late AnimationController controller;
  var isClicked = false;
  int currentIndex = 0;
  Timer? _timer;

  _startTimer() {
    _timer = Timer(const Duration(milliseconds: 500), () => isClicked = false);
  }

  void rotateAndDisplayNextImage({int? index}) {
    if (widget.sliderType == SliderType.singleViewSlider) {
      if (isClicked == false) {
        isClicked = true;
        _startTimer();
        setState(() {
          _turns += 1;
          currentIndex = (currentIndex + 1) % widget.widgets.length;
        });
        widget.onIndexChanged(currentIndex);
      }
    } else {
      currentIndex = index ?? 0;
      setState(() {});
      widget.onIndexChanged(currentIndex);
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 500), // Adjust animation duration as needed
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.sliderType == SliderType.multipleViewSlider
        ? Transform.rotate(
            alignment: Alignment.centerRight,
            angle: math.pi / 2,
            child: Align(
              alignment: Alignment.bottomRight,
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
                          height: 80,
                          child: widget.widgets[i],
                        ),
                      ),
                    );
                  },
                  itemCount: widget.widgets.length,
                ),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomRight,
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
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          height: 300,
                          child: widget.widgets[currentIndex],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
  }
}
