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

List testFocusData = [
  levelOne,
  levelTwo,
  levelThree,
  levelFour,
  levelFive,
  levelSix,
  levelSeven,
  levelEight,
];

List testFocusPracticeData = [
  levelOne,
  levelTwo,
];
