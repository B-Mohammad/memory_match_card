import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memory_match_card/models/card_item_model.dart';

class CardItemWidget extends StatefulWidget {
  final int num;
  const CardItemWidget({super.key, required this.num});

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  double _width = 100;
  final double _height = 150;
  Mode mode = Mode.hide;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 100,height: 150,
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              _width = 0;
            });
          },
          child: AnimatedContainer(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(4),
            ),
            duration: const Duration(milliseconds: 80),
            width: _width,
            height: _height,
            curve: Curves.fastOutSlowIn,
            onEnd: () {
              if (_width == 0 && mode == Mode.hide) {
                setState(() {
                  _width = 100;
                  mode = Mode.visible;
                });
              } else if (_width == 0 && mode == Mode.visible) {
                setState(() {
                  _width = 100;
                  mode = Mode.hide;
                });
              }
            },
            child: mode == Mode.hide
                ? SvgPicture.asset(
                    fit: BoxFit.fitHeight,
                    "images/card_asset.svg",
                  )
                : Text(
                    widget.num.toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                  ),
          ),
        ),
      ),
    );
  }
}
