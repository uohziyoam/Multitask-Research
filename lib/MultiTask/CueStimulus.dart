class CueStimulus {
  String stimulus;
  String type;
  bool isSwitchedTask;
  bool isOddOrVowl;
  int partition;
  bool exceedThresh;
  int testsSinceSwitch;

  CueStimulus(
      {this.stimulus,
      this.type,
      this.isSwitchedTask,
      this.isOddOrVowl,
      this.partition,
      this.exceedThresh,
      this.testsSinceSwitch});

  void flip(bool isFlipped) {
    stimulus = isFlipped
        ? new String.fromCharCodes(stimulus.runes.toList().reversed)
        : stimulus;
  }

  String toJson() {
    Map<String, dynamic> mp = {
      "stimulus": stimulus,
      "type": type,
      "isSwitechedTask": isSwitchedTask,
      "isOddOrVowl": isOddOrVowl,
      "partition": partition,
      "exceedThresh": exceedThresh,
      "switchSinceSwitch": testsSinceSwitch
    };
    return mp.toString();
  }

  factory CueStimulus.fromJson(Map parsedJson) {
    return CueStimulus(
        stimulus: parsedJson['stimulus'],
        type: parsedJson['type'],
        isSwitchedTask: parsedJson['isSwitchedTask'],
        isOddOrVowl: parsedJson['isOddOrVowl'],
        partition: parsedJson['partition'],
        exceedThresh: parsedJson['exceedThresh'],
        testsSinceSwitch: parsedJson['switchSinceSwitch']);
  }
}
