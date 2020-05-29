// import 'package:MultitaskResearch/OnboardingSite/firstPage.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// const String HomeRoute = '/home';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(
//         id: "",
//       ),
//       initialRoute: HomeRoute,
//       onGenerateRoute: generateRoute,
//     );
//   }
// }

// Route<dynamic> generateRoute(RouteSettings settings) {
//   var uriData = Uri.parse(settings.name);
//   print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
//   var routingData = uriData.queryParameters;
//   switch (uriData.path) {
//     case '/home':
//       return MaterialPageRoute(
//           builder: (_) => MyHomePage(
//                 id: routingData["id"],
//               ));
//     default:
//       return MaterialPageRoute(
//           builder: (_) => Scaffold(
//                 body: Center(
//                     child: Text('No route defined for ${settings.name}')),
//               ));
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, @required this.id}) : super(key: key);
//   final String id;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FirstPage(
//       id: widget.id,
//     ));
//   }
// }
