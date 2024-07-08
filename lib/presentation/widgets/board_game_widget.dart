import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memory_match_card/models/card_item_model.dart';
import 'package:memory_match_card/models/game_board_model.dart';
import 'package:memory_match_card/presentation/widgets/card_item_widget.dart';

class BoardGameWidget extends StatefulWidget {
  const BoardGameWidget({super.key});

  @override
  State<BoardGameWidget> createState() => _BoardGameWidgetState();
}

class _BoardGameWidgetState extends State<BoardGameWidget> {
  // List<CardItemWidget> cardItem = [];
  @override
  // void initState() {
  //   for (var element in game.cardsModel) {
  //     cardItem.add(CardItemWidget(
  //       itemModel: element,
  //       onChanged: (value) =>
  //           game.onCardPressed(game.cardsModel.indexOf(element)),
  //     ));
  //   }
  //   // cardItem = widget.game.;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    GameBoardModel gameBoardModel = Get.put(GameBoardModel(cardsWidth: 100));
    gameBoardModel.createCardsRandomly();

    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            gameBoardModel.startGame();
          },
          // () {
          //   for (var element in gameBoardModel.cardsModel) {
          //     element.mode = Mode.revealed;
          //     element.width = 0;

          //   }
          //   update();
          //   Timer(const Duration(seconds: 1), () {for (var element in gameBoardModel.cardsModel) {
          //     element.mode = Mode.revealed;
          //     element.width = 0;

          //   }
          //   update(); });
          //   // for (var i = 0; i < cardItem.length; i++) {
          //   //   cardItem[i] = CardItemWidget(
          //   //     itemModel: CardItemModel(
          //   //         type: cardItem[i].itemModel.type, mode: Mode.visible),
          //   //     width: 0,
          //   //   );
          //   // }
          //   // setState(() {});
          //   // Timer(const Duration(seconds: 1), () {
          //   //   for (var i = 0; i < cardItem.length; i++) {
          //   //     cardItem[i] = CardItemWidget(
          //   //       itemModel: CardItemModel(
          //   //           type: cardItem[i].itemModel.type, mode: Mode.hide),
          //   //       width: 0,
          //   //     );
          //   //   }
          //   //   setState(() {});
          //   // });
          // },
          style: ElevatedButton.styleFrom(fixedSize: const Size(300, 40)),
          child: const Text("Start"),
        ),
        const SizedBox(
          height: 16,
        ),
        GetBuilder<GameBoardModel>(
          builder: (controller) {
            return Column(
              children: List.generate(3, (rowIndex) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(10, (columnIndex) {
                    int index = rowIndex * 10 + columnIndex;
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardItemWidget(
                          itemModel: controller.cardsModel[index],
                          onTap: () {
                            controller.onCardPressed(index);
                          },
                        ));
                  }),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}
