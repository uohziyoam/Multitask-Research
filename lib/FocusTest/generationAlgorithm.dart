import 'dart:math';

import 'package:MultitaskResearch/FocusTest/square.dart';

class TestFocusRandomAlgorithm {
  final random = new Random();
  static const int GRID_SIZE = 3;
  List<int> seeds = new List<int>.generate(GRID_SIZE * GRID_SIZE, (i) => i + 1);

  List<int> angles = [0, 45, 90, 135];

  coordinateToX(int number) {
    return (number - 1) ~/ GRID_SIZE;
  }

  coordinateToY(int number) {
    return (number - 1) % GRID_SIZE;
  }

  chooseOneAngle() {
    return angles[random.nextInt(angles.length)];
  }

  initGrid() {
    List<List<M>> result = [];
    for (int i = 0; i < GRID_SIZE; i++) {
      result.add([]);
      for (int j = 0; j < GRID_SIZE; j++) {
        result[i].add(new M(0, SquareColor.WHITE));
      }
    }

    return result;
  }

  generateConsecutiveTask(bool isRectangleRotated, int numOfBlueRect) {
    List<int> remainSeeds = seeds.sublist(0);
    List<List<M>> before = initGrid();
    List<List<M>> after = initGrid();
    Map<String, dynamic> result = {};

    for (var i = 0; i < numOfBlueRect; i++) {
      int element = remainSeeds[random.nextInt(remainSeeds.length)];
      int choosedAngle = chooseOneAngle();
      int x = coordinateToX(element);
      int y = coordinateToY(element);
      M dp = new M(choosedAngle, SquareColor.BLUE);
      before[x][y] = dp;
      after[x][y] = dp;

      remainSeeds.removeWhere((e) => e == element);
    }

    for (var i = 0; i < 2; i++) {
      int element = remainSeeds[random.nextInt(remainSeeds.length)];
      int choosedAngle = chooseOneAngle();
      int x = coordinateToX(element);
      int y = coordinateToY(element);

      before[x][y] = new M(choosedAngle, SquareColor.RED);
      after[x][y] = new M(
          isRectangleRotated && i == random.nextInt(1)
              ? choosedAngle + 45
              : choosedAngle,
          SquareColor.RED);

      remainSeeds.removeWhere((e) => e == element);
    }

    result = {
      'isAnyRedTargetRotated': isRectangleRotated,
      'numberOfBlueRectangles': numOfBlueRect,
      "before": before,
      "after": after,
    };

    // print(remainSeeds);
    // print(before);
    // print(after);
    // print(result);

    return result;
  }
}

// main(List<String> args) {
//   TestFocusRandomAlgorithm t = new TestFocusRandomAlgorithm();

//   print(t.generateConsecutiveTask(true, 2));
// }
