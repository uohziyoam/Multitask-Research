import 'dart:math';
import 'package:MultitaskResearch/test.dart';

class RandomAlgorithm {
  static final List<String> vowels = ["a", "e", "i", "u"];
  static final List<String> consonants = ["p", "k", "n", "s"];
  static final List<String> even = ["2", "4", "6", "8"];
  static final List<String> odd = ["3", "5", "7", "9"];
  List<CueStimulus> config = [];
  List<int> test = [4, 4, 4, 4, 4, 4, 4, 4];
  Random random = Random();

  generateConsecutiveTask(int numberOfTasks, String taskType) {
    String task = "";

    bool isOddOrVowl = random.nextInt(2) == 0 ? true : false;
    bool isSwitchedTask = true;

    for (int i = 0; i < numberOfTasks; i++) {
      int nextRandom = random.nextInt(4);
      if (config.isNotEmpty) {
        isSwitchedTask = config.last.type != taskType;
      }
      task = isOddOrVowl
          ? vowels[nextRandom] + odd[nextRandom]
          : consonants[nextRandom] + even[nextRandom];
      config.add(CueStimulus(
          isOddOrVowl: isOddOrVowl,
          stimulus: task,
          type: taskType,
          isSwitchedTask: isSwitchedTask));
    }
  }
}
