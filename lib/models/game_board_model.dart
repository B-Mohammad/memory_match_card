import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:memory_match_card/models/card_item_model.dart';

class GameBoardModel extends GetxController {
  List<CardItemModel> cardsModel = [];
  int selectedIndex = 999;
  int lock = 0;
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
    lock++;
    if (lock % 2 == 0) {
      checkMatch(selectedIndex, index);
    } else {
      selectedIndex = index;
    }
    update();
  }

  void checkMatch(int selectedCard1, int selectedCard2) {
    if (cardsModel[selectedCard1].type == cardsModel[selectedCard2].type) {
      cardsModel[selectedCard1].mode = Mode.matched;
      cardsModel[selectedCard2].mode = Mode.matched;
      isGameOver = checkIsGameOver();
      if (isGameOver) {
        createCardsRandomly();
      }
    } else {
      Timer(const Duration(seconds: 1), () {
        cardsModel[selectedCard1].mode = Mode.hidden;
        cardsModel[selectedCard1].width = 0;
        cardsModel[selectedCard2].mode = Mode.hidden;
        cardsModel[selectedCard2].width = 0;
      });
    }
    update();
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
    time = 0;
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
