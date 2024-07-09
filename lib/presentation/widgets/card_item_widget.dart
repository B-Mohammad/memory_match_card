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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: widget.itemModel.mode == Mode.hidden ? widget.onTap : null,
          child: AnimatedContainer(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
              color: widget.itemModel.mode == Mode.hidden
                  ? Colors.grey[50]
                  : widget.itemModel.getColorItem(),
              borderRadius: BorderRadius.circular(10),
            ),
            duration: const Duration(milliseconds: 100),
            width: widget.itemModel.width,
            height: _height,
            curve: Curves.fastOutSlowIn,
            onEnd: () {
              setState(() {
                widget.itemModel.width = 100;
              });
            },
            child: widget.itemModel.mode == Mode.hidden
                ? Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(
                      fit: BoxFit.fitHeight,
                      "assets/images/card_asset.svg",
                    ),
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
