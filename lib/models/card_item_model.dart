import 'package:flutter/cupertino.dart';

class CardItemModel {
  static const List<IconData> _itemIcon = [
    CupertinoIcons.airplane,
    CupertinoIcons.alarm_fill,
    CupertinoIcons.ant_fill,
    CupertinoIcons.bell_fill,
    CupertinoIcons.bed_double_fill,
    CupertinoIcons.book_fill,
    CupertinoIcons.car_detailed,
    CupertinoIcons.camera_fill,
    CupertinoIcons.cloud_moon_fill,
    CupertinoIcons.double_music_note,
    CupertinoIcons.gamecontroller_fill,
    CupertinoIcons.house_fill,
    CupertinoIcons.lightbulb_fill,
    CupertinoIcons.moon_stars_fill,
    CupertinoIcons.moon_fill,
    CupertinoIcons.paintbrush_fill,
    CupertinoIcons.rocket,
    CupertinoIcons.sun_max_fill,
    CupertinoIcons.tortoise_fill,
    CupertinoIcons.tornado
  ];
  static const List<Color> _itemColor = [
    Color.fromRGBO(255, 0, 0, 1.0), // Red
    Color.fromRGBO(0, 255, 0, 1.0), // Green
    Color.fromRGBO(0, 0, 255, 1.0), // Blue
    Color.fromRGBO(255, 255, 0, 1.0), // Yellow
    Color.fromRGBO(255, 165, 0, 1.0), // Orange
    Color.fromRGBO(128, 0, 128, 1.0), // Purple
    Color.fromRGBO(255, 192, 203, 1.0), // Pink
    Color.fromRGBO(165, 42, 42, 1.0), // Brown
    Color.fromRGBO(0, 255, 255, 1.0), // Cyan
    Color.fromRGBO(50, 205, 50, 1.0), // LimeGreen
    Color.fromRGBO(75, 0, 130, 1.0), // Indigo
    Color.fromRGBO(0, 128, 128, 1.0), // Teal
    Color.fromRGBO(255, 223, 0, 1.0), // Amber
    Color.fromRGBO(128, 128, 128, 1.0), // Grey
    Color.fromRGBO(70, 130, 180, 1.0), // SteelBlue
    Color.fromRGBO(173, 216, 230, 1.0), // LightBlue
    Color.fromRGBO(144, 238, 144, 1.0), // LightGreen
    Color.fromRGBO(255, 140, 0, 1.0), // DarkOrange
    Color.fromRGBO(147, 112, 219, 1.0), // MediumPurple
    Color.fromRGBO(0, 255, 127, 1.0), // SpringGreen
  ];

  final int type;
  Mode mode;
  double width;

  CardItemModel(
      {required this.type, this.mode = Mode.hidden, required this.width});

  Color getColorItem() {
    return _itemColor[type];
  }

  IconData getIconItem() {
    return _itemIcon[type];
  }
}

enum Mode { hidden, revealed, matched }
