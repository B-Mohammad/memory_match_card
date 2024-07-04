import 'package:flutter/material.dart';

class CardItemModel {
  Color color;
  Icon icon;
  Mode mode;
  String backGround;

  CardItemModel({
    required this.color,
    required this.icon,
    required this.mode,
    this.backGround = "assets/images/card_assets.svg",
  });
}

enum Mode { hide, visible }
