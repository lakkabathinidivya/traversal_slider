# traversal_slider

The traversal_slider package is a Flutter widget that allows for the smooth and animated traversal of widgets in a circular rotation.

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  traversal_slider: ^1.0.0
```

In your library add the following import:

```dart
import 'package:traversal_slider/traversal_slider.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Example

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

<img src="singleViewSlider.gif?raw=true" width="200px" height="400px">


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

<img src="multipleViewSlider.gif?raw=true" width="200px" height="400px">


## Options

|          Name         |           Description               |          Default              |        Return          |
| :-------------------: | :---------------------------------: | :----------:                  |  :------------------:  |
| widgets               | For assign widgets list             |     `[]`                      |           -            |
| sliderType            | For Different Slider Types          | `SliderType.singleViewSlider` |           -            | 
| onIndexChange         | Trigger when widget animate/change  |             0                 | `current widget index` | 

