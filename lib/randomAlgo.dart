import 'dart:math';
import 'package:MultitaskResearch/test.dart';

class RandomAlgorithm {
  static final List<String> vowels = ["a", "e", "i", "u"];
  static final List<String> consonants = ["p", "k", "n", "s"];
  static final List<String> even = ["2", "4", "6", "8"];
  static final List<String> odd = ["3", "5", "7", "9"];

  static final List<String> number = ["2", "4", "6", "8", "3", "5", "7", "9"];
  static final List<String> letter = ["a", "e", "i", "u", "p", "k", "n", "s"];

  List<CueStimulus> config = [];
  List<int> test = [4, 4, 4, 4, 4, 4, 4, 4];
  Random random = Random();

  generateConsecutiveTask(int numberOfTasks, String taskType) {
    String task = "";

    List<bool> listOfIsOddOrVowl = [];

    for (var i = 0; i < numberOfTasks; i++) {
      if (taskType == "LETTER") {
        listOfIsOddOrVowl.add(i.isEven ? true : false);
      } else {
        listOfIsOddOrVowl.add(i.isEven ? false : true);
      }
    }

    listOfIsOddOrVowl = listOfIsOddOrVowl + listOfIsOddOrVowl;

    bool isSwitchedTask = true;

    for (int i = 0; i < numberOfTasks; i++) {
      int numberNextRandom = random.nextInt(4);
      int letterNextRandom = random.nextInt(4);

      if (config.isNotEmpty) {
        isSwitchedTask = config.last.type != taskType;
      }

      if (taskType == "NUMBER") {
        task = listOfIsOddOrVowl[i]
            ? letter[letterNextRandom] + odd[numberNextRandom]
            : letter[letterNextRandom] + even[numberNextRandom];
      }

      if (taskType == "LETTER") {
        task = listOfIsOddOrVowl[i]
            ? vowels[letterNextRandom] + number[numberNextRandom]
            : consonants[letterNextRandom] + number[numberNextRandom];
      }

      if (config.isNotEmpty && task == config.last.stimulus) {
        numberOfTasks++;
        continue;
      }

      config.add(CueStimulus(
          isOddOrVowl: listOfIsOddOrVowl[i],
          stimulus: task,
          type: taskType,
          isSwitchedTask: isSwitchedTask,
          partition: numberOfTasks));
    }
  }

  flip() {
    for (var i = 0; i < config.length; i++) {
      bool isFlipped = random.nextInt(2) == 0 ? true : false;
      config[i].flip(isFlipped);
    }
  }
}
