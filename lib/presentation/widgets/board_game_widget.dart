import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memory_match_card/models/card_item_model.dart';
import 'package:memory_match_card/presentation/widgets/card_item_widget.dart';

class BoardGameWidget extends StatelessWidget {
  const BoardGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> cardItem = createRandomCard();
    return Column(
      children: List.generate(3, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(10, (columnIndex) {
            int index = rowIndex * 10 + columnIndex;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardItemWidget(
                itemModel: CardItemModel(type: cardItem[index]),
              ),
            );
          }),
        );
      }),
    );
  }

  List<int> createRandomCard() {
    List<int> cardItem = List.filled(30, 999);
    List<int> items = List.generate(30, (index) => index);
    List<int> itemsType = List.generate(20, (index) => index);
    while (items.isNotEmpty) {
      int randIndex = Random().nextInt(itemsType.length);

      int randPos = Random().nextInt(items.length);
      cardItem[items[randPos]] = itemsType[randIndex];
      items.removeAt(randPos);

      randPos = Random().nextInt(items.length);
      cardItem[items[randPos]] = itemsType[randIndex];
      items.removeAt(randPos);

      itemsType.removeAt(randIndex);
    }
    return cardItem;
  }
}
