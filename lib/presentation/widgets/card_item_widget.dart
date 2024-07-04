import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItemWidget extends StatefulWidget {
  const CardItemWidget({super.key});

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      child: SvgPicture.asset("images/card_asset.svg"),
    );
  }
}
