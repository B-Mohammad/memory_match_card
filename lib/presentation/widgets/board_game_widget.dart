import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memory_match_card/models/game_board_model.dart';
import 'package:memory_match_card/presentation/widgets/card_item_widget.dart';

class BoardGameWidget extends StatelessWidget {
  const BoardGameWidget({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    GameBoardModel gameBoardModel = Get.put(GameBoardModel(cardsWidth: 100));
    gameBoardModel.createCardsRandomly();

    return Column(
      children: [
        GetBuilder<GameBoardModel>(builder: (controller) {
          return ElevatedButton(
            onPressed: controller.isGameOver
                ? () {
                    controller.startGame();
                  }
                : null,
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(300, 45),
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 6, 96, 8),
                disabledBackgroundColor: const Color.fromARGB(255, 131, 17, 9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
            child: gameBoardModel.isGameOver
                ? const Text("Start")
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "${controller.time} S",
                        ),
                      ),
                      const Icon(
                        Icons.timer_sharp,
                        size: 18,
                      )
                    ],
                  ),
          );
        }),
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
                          onTap: controller.isGameOver
                              ? null
                              : () {
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
