import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:memory_match_card/models/card_item_model.dart';

class GameBoardModel extends GetxController {
  List<CardItemModel> cardsModel = [];
  List<int> revealedCardIndexes = [];
  bool isGameOver;
  double cardsWidth;
  int time;

  GameBoardModel({
    this.isGameOver = true,
    required this.cardsWidth,
    this.time = 0,
  });

  bool checkIsGameOver() {
    return cardsModel.every((element) => element.mode == Mode.matched);
  }

  void onCardPressed(int index) {
    cardsModel[index].mode = Mode.revealed;
    cardsModel[index].width = 0;
    update();
    revealedCardIndexes.add(index);
    if (revealedCardIndexes.length == 2) {
      if (cardsModel[revealedCardIndexes[0]].type ==
          cardsModel[revealedCardIndexes[1]].type) {
        cardsModel[revealedCardIndexes[0]].mode = Mode.matched;
        cardsModel[revealedCardIndexes[1]].mode = Mode.matched;
        isGameOver = checkIsGameOver();
      } else {
        // Timer(const Duration(seconds: 1), () {
        // cardsModel[revealedCardIndexes[0]] = CardItemModel(
        //     type: cardsModel[revealedCardIndexes[0]].type, width: 0);
        // cardsModel[revealedCardIndexes[1]] = CardItemModel(
        //     type: cardsModel[revealedCardIndexes[1]].type, width: 0);
        // cardsModel[revealedCardIndexes[0]].mode = Mode.hidden;
        // cardsModel[revealedCardIndexes[0]].width = 0;

        Timer(const Duration(seconds: 1), () {
          print("object");
        });
        // update();
      }
      // update();

      print(revealedCardIndexes);
      revealedCardIndexes = [];
    }
  }

  void createCardsRandomly() {
    List<int> itemsType = List.generate(20, (index) => index);
    for (var i = 0; i < 30; i = i + 2) {
      int randIndex = Random().nextInt(itemsType.length);

      cardsModel.add(CardItemModel(
        type: itemsType[randIndex],
        width: cardsWidth,
      ));
      cardsModel.add(CardItemModel(
        type: itemsType[randIndex],
        width: cardsWidth,
      ));

      itemsType.removeAt(randIndex);
    }
    cardsModel.shuffle();
  }

  void startGame() {
    isGameOver = false;
    setTimer();
    for (var element in cardsModel) {
      element.mode = Mode.revealed;
      element.width = 0;
    }
    update();
    Timer(const Duration(seconds: 1), () {
      for (var element in cardsModel) {
        element.mode = Mode.hidden;
        element.width = 0;
      }
      update();
    });
  }

  void setTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isGameOver) {
        timer.cancel();
      } else {
        time++;
        update();
      }
    });
  }
}
