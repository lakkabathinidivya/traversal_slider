# traversal_slider

The traversal_slider package is a Flutter widget that allows for the smooth and animated traversal of widgets in a circular rotation.

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  traversal_slider: ^1.0.2
```

In your library add the following import:

```dart
import 'package:traversal_slider/traversal_slider.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Example


Multiple View Slider implementation

```dart
TraversalSliderWidget(
   widgets: List.generate(
       foodImages.length,
       (index) => Image.asset(
          foodImages[index],
          fit: BoxFit.cover,
        ),
      ),
   sliderType: SliderType.multipleViewSlider,
   onIndexChanged: (value) {
     currentIndex = value;
     setState(() {});
   },
  ),
```

![me](https://firebasestorage.googleapis.com/v0/b/traversalslider.appspot.com/o/multipleViewSlider.gif?alt=media&token=1fab414e-51f7-4dad-9468-2071282ba03c)



Single View Slider implementation

```dart
TraversalSliderWidget(
   widgets: List.generate(
       foodImages.length,
       (index) => Image.asset(
          foodImages[index],
          fit: BoxFit.cover,
        ),
      ),
   sliderType: SliderType.singleViewSlider,
   onIndexChanged: (value) {
     currentIndex = value;
     setState(() {});
   },
  ),
```

![me](https://firebasestorage.googleapis.com/v0/b/traversalslider.appspot.com/o/singleViewSlider.gif?alt=media&token=3035c76b-d360-4f4e-b497-5e2d0f02256d)


## Options

|          Name         |           Description               |          Default              |        Return          |
| :-------------------: | :---------------------------------: | :----------:                  |  :------------------:  |
| widgets               | For assign widgets list             |     `[]`                      |           -            |
| sliderType            | For Different Slider Types          | `SliderType.singleViewSlider` |           -            | 
| onIndexChange         | Trigger when widget animate/change  |             0                 | `current widget index` | 

