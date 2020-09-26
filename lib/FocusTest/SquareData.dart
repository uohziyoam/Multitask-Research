import 'package:MultitaskResearch/FocusTest/generationAlgorithm.dart';

TestFocusRandomAlgorithm algorithm = new TestFocusRandomAlgorithm();

Map<String, dynamic> levelOne = algorithm.generateConsecutiveTask(true, 0);

Map<String, dynamic> levelTwo = algorithm.generateConsecutiveTask(false, 0);

Map<String, dynamic> levelThree = algorithm.generateConsecutiveTask(true, 2);

Map<String, dynamic> levelFour = algorithm.generateConsecutiveTask(false, 2);

Map<String, dynamic> levelFive = algorithm.generateConsecutiveTask(true, 4);

Map<String, dynamic> levelSix = algorithm.generateConsecutiveTask(false, 4);

Map<String, dynamic> levelSeven = algorithm.generateConsecutiveTask(true, 6);

Map<String, dynamic> levelEight = algorithm.generateConsecutiveTask(false, 6);

List generator() {
  const int PAIRS = 10;
  List<int> blueRecPattern = [0, 2, 4, 6];

  List testFocusData = [];

  for (int i = 0; i < PAIRS; i++) {
    for (int item in blueRecPattern) {
      testFocusData.add(algorithm.generateConsecutiveTask(true, item));
      testFocusData.add(algorithm.generateConsecutiveTask(false, item));
    }
  }

  testFocusData.shuffle();

  return testFocusData;
}

List testFocusData = generator();

List testFocusPracticeData = [
  algorithm.generateConsecutiveTask(false, 0),
  algorithm.generateConsecutiveTask(false, 2),
  algorithm.generateConsecutiveTask(true, 0),
  algorithm.generateConsecutiveTask(true, 2),
];
