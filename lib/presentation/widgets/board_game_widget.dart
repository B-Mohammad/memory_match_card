import 'package:flutter/material.dart';
import 'package:memory_match_card/presentation/widgets/card_item_widget.dart';

class BoardGameWidget extends StatelessWidget {
  const BoardGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
            children: List.generate(6, (index) => CardItemWidget(num: index)))
      ],
    );
  }
}
