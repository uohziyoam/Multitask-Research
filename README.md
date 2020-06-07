# ![](/assets/bu-bg.jpg)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/uohziyoam/Multitask-Research) [![License](https://img.shields.io/github/license/appditto/natrium_wallet_flutter)](https://github.com/uohziyoam/Multitask-Research/blob/master/LICENSE) [![Twitter Follow](https://img.shields.io/twitter/follow/bucomresearch?lang=en?style=social)](https://twitter.com/intent/follow?screen_name=bucomresearch)

The interactive consists of  a task juggling exercise which then scores the user's task performance (speed, accuracy, how those depend on whether or not a task switch occurred, etc.). Recreating the whole project from - [New York Times](https://archive.nytimes.com/www.nytimes.com/interactive/2010/06/07/technology/20100607-task-switching-demo.html). It is written in Dart using [Flutter](https://flutter.io).

## Motivation
Most popular browsers do not support Flash any more. Thus, in order to achieve better user experience, we decided to recreat this task by using more recent technologies.

| Link | Description |
| :----- | :------ |
[bu.edu](https://commresearchstudy.com/#/exercisets) | Juggle Task Test HomePage
[bu.edu/bording](https://commresearchstudy.com/#/instruction) | Onboarding Page

## Screenshots
![Instruction Page](/assets/instruction.gif) 

## About Data Export

* First go to [CsvJsonReport](https://us-central1-common-research.cloudfunctions.net/csvJsonReport) in most recent browsers (e.g. Chrome, Firefox)
* Wait for a few seconds until the page automatically redirect you to the firebase storage console
* Choose **Storage** on the left navbar
* Go to folder `reports/`, then click `report.csv`
* Click __**Create new access token**__ under File location tab
* Click token generated below **Access token** (the URL will be copied automatically) and paste the URL into browser, then the file will be automatically downloaded

![Instruction Page](/assets/data-export.gif) 


## Program Setup

* Fork the repository and clone it to your local machine
* Follow the instructions [here](https://flutter.io/docs/get-started/install) to install the Flutter SDK
* Setup [Android Studio](https://flutter.io/docs/development/tools/android-studio) or [Visual Studio Code](https://flutter.io/docs/development/tools/vs-code).

## Structure

The high level design of the whole project is based on the following components:

```
├─functions # includes all cloud functions (e.g. jsonToCsv)
├─lib # includes all main logics
└─web # compiled version of application
```

## Compiling

To compile the program:

```
flutter run -d Chrome
```

To recompile the program:

```
cold restart: tap r in command line
hot restart: tap shift + r in command line
```

## Building

Web: `flutter build`

If you have a connected device or emulator you can run and deploy the app with `flutter run`

## Have a question?

If you need any help, drop [Beck](https://maoyizhou.com) a line! 

## License

This project is released under the MIT License

MIT © [Communication Research Center](http://sites.bu.edu/crc/)
