import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_match_card/presentation/widgets/card_item_widget.dart';

class BoardGameWidget extends StatelessWidget {
  const BoardGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (columnIndex) {
            int index = rowIndex * 10 + columnIndex;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardItemWidget(num: index),
            );
          }),
        );
      }),
    );
  }
}
