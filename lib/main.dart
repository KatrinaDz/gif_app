import 'package:flutter/material.dart';
import 'package:gif_app/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        builder: (buildContext, widget) {
          return ConnectivityWidgetWrapper(   
            disableInteraction: true,
            height: 60,
            child: widget!,
            message: 'Offline',
            messageStyle: const TextStyle(
               color: Colors.white,
               fontSize: 25.0,
            decoration: TextDecoration.none,
  ),
          );
        },
      ),
    );
  }
}
