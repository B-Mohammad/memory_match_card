import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:memory_match_card/models/card_item_model.dart';
import 'package:memory_match_card/presentation/widgets/custom_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameBoardModel extends GetxController {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();

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

  void checkIsGameOver() async {
    isGameOver = cardsModel.every((element) => element.mode == Mode.matched);
    if (isGameOver) {
      final SharedPreferences storage = await _storage;
      List<String> temp = storage.getStringList("timeRecord") ?? [];
      final List<int> timesRecord = temp.map((e) => int.parse(e)).toList();
      timesRecord.add(time);
      timesRecord.sort();
      temp = timesRecord.map((e) => e.toString()).toList();
      await storage.setStringList('timeRecord', temp);

      cardsModel = [];
      createCardsRandomly();
      showCustomDialog(
          data: temp,
          latestIndex: timesRecord.indexWhere((element) => element == time));
      // update(["board,timer"]);
    }
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
    update(["board"]);
  }

  void checkMatch(int selectedCard1, int selectedCard2) {
    if (cardsModel[selectedCard1].type == cardsModel[selectedCard2].type) {
      cardsModel[selectedCard1].mode = Mode.matched;
      cardsModel[selectedCard2].mode = Mode.matched;
      checkIsGameOver();
      update(["board"]);
    } else {
      Timer(const Duration(milliseconds: 500), () {
        cardsModel[selectedCard1].mode = Mode.hidden;
        cardsModel[selectedCard1].width = 0;
        cardsModel[selectedCard2].mode = Mode.hidden;
        cardsModel[selectedCard2].width = 0;
        update(["board"]);
      });
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
    time = 0;
    setTimer();
    for (var element in cardsModel) {
      element.width = 0;
      element.mode = Mode.revealed;
    }
    update(["board", "timer"]);
    Timer(const Duration(seconds: 1), () {
      for (var element in cardsModel) {
        element.width = 0;
        element.mode = Mode.hidden;
      }
      update(["board"]);
    });
  }

  void setTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isGameOver) {
        timer.cancel();
      } else {
        time++;
      }
      update(["timer"]);
    });
  }

  void showCustomDialog({
    required List<String?> data,
    required int latestIndex,
  }) {
    Get.defaultDialog(
        content: CustomDialog(
          data: data,
          latestIndex: latestIndex,
        ),
        title: "List Of Time Record",
        titleStyle: const TextStyle(fontSize: 18),
        radius: 8,
        contentPadding: EdgeInsets.zero);
  }
}
