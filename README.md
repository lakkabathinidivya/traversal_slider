# traversal_slider

This is a package created in the style of the instagram reels viewer, with which you can pass video url and get reels view.

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

Simple implementation

```dart
TraversalSliderWidget(
   widgets: List.generate(
       foodImages.length,
       (index) => Image.asset(
          foodImages[index],
          fit: BoxFit.cover,
        ),
      ),
   onIndexChanged: (value) {
     currentIndex = value;
     setState(() {});
   },
  ),
```

## Options

|          Name         |           Description               |   Default    |        Return          |
| :-------------------: | :---------------------------------: | :----------: |  :------------------:  |
| widgets               | For assign widgets list             |     `[]`     |           -            |
| onIndexChange         | Trigger when widget animate/change  |      -       | `current widget index' | 


## Demo video

[Click here](https://firebasestorage.googleapis.com/v0/b/reels-viwer.appspot.com/o/screenshot_video.mp4?alt=media&token=37c69d1b-1ec9-412d-8b4c-e42dbc99660f) for watch demo video.
