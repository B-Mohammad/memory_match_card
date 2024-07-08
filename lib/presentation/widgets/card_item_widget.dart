import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memory_match_card/models/card_item_model.dart';

class CardItemWidget extends StatefulWidget {
  final CardItemModel itemModel;
  final void Function()? onTap;

  const CardItemWidget({
    super.key,
    required this.itemModel,
    required this.onTap,
  });

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  final double _height = 150;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 150,
      child: Center(
        child: InkWell(
          onTap: widget.itemModel.mode == Mode.hidden ? widget.onTap : null,
          child: AnimatedContainer(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: widget.itemModel.mode == Mode.hidden
                  ? Colors.grey[50]
                  : widget.itemModel.getColorItem(),
              borderRadius: BorderRadius.circular(4),
            ),
            duration: const Duration(milliseconds: 80),
            width: widget.itemModel.width,
            height: _height,
            curve: Curves.fastOutSlowIn,
            onEnd: () {
              // if (widget.itemModel.width == 0 &&
              //     widget.itemModel.mode == Mode.hidden) {
              //   widget.itemModel.mode = Mode.revealed;
              // } else if (widget.itemModel.width == 0 &&
              //     widget.itemModel.mode == Mode.revealed) {
              //   widget.itemModel.mode = Mode.hidden;
              // }
              setState(() {
                widget.itemModel.width = 100;
              });
            },
            child: widget.itemModel.mode == Mode.hidden
                ? SvgPicture.asset(
                    fit: BoxFit.fitHeight,
                    "images/card_asset.svg",
                  )
                : Icon(
                    widget.itemModel.getIconItem(),
                    color: Colors.white,
                    size: 32,
                  ),
          ),
        ),
      ),
    );
  }
}
