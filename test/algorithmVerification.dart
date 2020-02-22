import 'dart:io';
import 'dart:math';
import 'package:MultitaskResearch/CueStimulus.dart';
import 'package:MultitaskResearch/randomAlgo.dart';

Future<List<CueStimulus>> loadData(isInstruction) async {
  return execuate();
}

List<int> randomSequence(int maxInt) {
  List<int> odd = [1, 3, 5, 7];
  List<int> even = [0, 2, 4, 6];

  List<int> randomEven = [];
  List<int> randomOdd = [];
  List<int> randomSequence = [];
  Random random = Random();

  while (randomEven.length != 4) {
    int nextRandom = random.nextInt(4);
    if (randomEven.contains(even[nextRandom])) {
      continue;
    }
    randomEven.add(even[nextRandom]);
  }

  while (randomOdd.length != 4) {
    int nextRandom = random.nextInt(4);
    if (randomOdd.contains(odd[nextRandom])) {
      continue;
    }
    randomOdd.add(odd[nextRandom]);
  }

  for (var i = 0; i < 4; i++) {
    randomSequence.add(randomEven[i]);
    randomSequence.add(randomOdd[i]);
  }

  return randomSequence;
}

List<CueStimulus> execuate() {
  RandomAlgorithm randomAlgorithm = new RandomAlgorithm();
  List<int> ranSequence = randomSequence(8) +
      randomSequence(8) +
      randomSequence(8) +
      randomSequence(8);

  for (int i = 0; i < 32; i++) {
    switch (ranSequence[i]) {
      case 0:
        randomAlgorithm.generateConsecutiveTask(1, "LETTER");
        break;
      case 1:
        randomAlgorithm.generateConsecutiveTask(1, "NUMBER");
        break;
      case 2:
        randomAlgorithm.generateConsecutiveTask(2, "LETTER");
        break;
      case 3:
        randomAlgorithm.generateConsecutiveTask(2, "NUMBER");
        break;
      case 4:
        randomAlgorithm.generateConsecutiveTask(3, "LETTER");
        break;
      case 5:
        randomAlgorithm.generateConsecutiveTask(3, "NUMBER");
        break;
      case 6:
        randomAlgorithm.generateConsecutiveTask(4, "LETTER");
        break;
      case 7:
        randomAlgorithm.generateConsecutiveTask(4, "NUMBER");
        break;
    }
  }

  randomAlgorithm.flip();

  File file = new File('algorithmExperiment.txt');

  // file.writeAsStringSync(
  //     "stimulus,type,isOddOrVowl,isSwitchedTask,testsSinceSwitch,partition,\n",
  //     mode: FileMode.append);
  // randomAlgorithm.config.forEach((element) {
  //   file.writeAsStringSync(element.stimulus + ",", mode: FileMode.append);
  //   file.writeAsStringSync(element.type + ",", mode: FileMode.append);
  //   file.writeAsStringSync(element.isOddOrVowl.toString() + ",",
  //       mode: FileMode.append);
  //   file.writeAsStringSync(element.isSwitchedTask.toString() + ",",
  //       mode: FileMode.append);
  //   file.writeAsStringSync(element.testsSinceSwitch.toString() + ",",
  //       mode: FileMode.append);
  //   file.writeAsStringSync(element.partition.toString() + ",\n",
  //       mode: FileMode.append);
  // });

  int countOfLetter = 0,
      countOfNumber = 0,
      countOfNumberLetter = 0,
      countOfLetterNumber = 0,
      countOfOddVowl = 0,
      countOfEvenConsonant = 0,
      countOfFreq1 = 0,
      countOfFreq2 = 0,
      countOfFreq3 = 0,
      countOfFreq4 = 0;

  bool isCorrect = false;

  randomAlgorithm.config.forEach((element) {
    if (element.type == "LETTER") {
      countOfLetter += 1;
    }
    if (element.type == "NUMBER") {
      countOfNumber += 1;
    }

    if (isNumeric(element.stimulus.substring(0, 1))) {
      countOfNumberLetter += 1;
    }
    if (isNumeric(element.stimulus.substring(1, 2))) {
      countOfLetterNumber += 1;
    }

    if (element.isOddOrVowl) {
      countOfOddVowl += 1;
    }
    if (!element.isOddOrVowl) {
      countOfEvenConsonant += 1;
    }

    if (element.partition == 1) {
      countOfFreq1 += 1;
    }
    if (element.partition == 2) {
      countOfFreq2 += 1;
    }
    if (element.partition == 3) {
      countOfFreq3 += 1;
    }
    if (element.partition == 4) {
      countOfFreq4 += 1;
    }
  });

  if (countOfLetter == 40 &&
      countOfNumber == 40 &&
      countOfNumberLetter == 40 &&
      countOfLetterNumber == 40 &&
      countOfOddVowl == 40 &&
      countOfEvenConsonant == 40 &&
      countOfFreq1 == 8 &&
      countOfFreq2 == 16 &&
      countOfFreq3 == 24 &&
      countOfFreq4 == 32) {
    isCorrect = true;
  }

  // file.writeAsStringSync(
  //     "isCorrect,countOfLetter,countOfNumber,countOfNumberLetter,countOfLetterNumber,countOfOddVowl,countOfEvenConsonant,countOfFreq1,countOfFreq2,countOfFreq3,countOfFreq4\n",
  //     mode: FileMode.append);
  file.writeAsStringSync(isCorrect ? "T" + "," : "F" + ",",
      mode: FileMode.append);
  file.writeAsStringSync(countOfLetter.toString() + ",", mode: FileMode.append);
  file.writeAsStringSync(countOfNumber.toString() + ",", mode: FileMode.append);
  file.writeAsStringSync(countOfNumberLetter.toString() + ",",
      mode: FileMode.append);
  file.writeAsStringSync(countOfLetterNumber.toString() + ",",
      mode: FileMode.append);
  file.writeAsStringSync(countOfOddVowl.toString() + ",",
      mode: FileMode.append);
  file.writeAsStringSync(countOfEvenConsonant.toString() + ",",
      mode: FileMode.append);
  file.writeAsStringSync(countOfFreq1.toString() + ",", mode: FileMode.append);
  file.writeAsStringSync(countOfFreq2.toString() + ",", mode: FileMode.append);
  file.writeAsStringSync(countOfFreq3.toString() + ",", mode: FileMode.append);
  file.writeAsStringSync(countOfFreq4.toString() + ",\n",
      mode: FileMode.append);

  return randomAlgorithm.config;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

main(List<String> args) {
  for (var i = 0; i < 200; i++) {
    loadData(false);
  }
}
