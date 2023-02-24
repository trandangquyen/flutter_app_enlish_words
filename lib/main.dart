import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/packages/quote/quote.dart';
import 'package:flutter_application_1/packages/quote/quote_model.dart';

import 'pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Quotes().getAll();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage());
  }
}
