import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/views/about.dart';
import 'package:vendor_list/views/companyList.dart';
import 'package:vendor_list/views/contact.dart';
import 'package:vendor_list/views/home.dart';
import 'package:vendor_list/views/info.dart';
import 'package:vendor_list/views/search_screen.dart';
import 'package:vendor_list/views/welcome_screen.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'models/about/about_response.dart';
import 'models/company_model.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool future = false;

  Future<void> _getFutureBool() {
    return Future.delayed(Duration(milliseconds: 3000))
        .then((onValue) => setState(() {
// Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context)=>Home())));
              future = true;
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    _getFutureBool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Language>(
      create: (context)=>Language(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Vendor List",
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home:
          // AboutScreen(),
            // CompanyList(section: "bla",id: 2,),
            // SearchScreen(),

            !future == true ? WelcomeScreen() : Home(),
// routes: {
//   '/':(context)=>Home(),
// },
        // WelcomeScreen(),
        // CompanyList(section: "Home Automation",),
        // Info(section: "Home Automation",),
      ),
    );
  }
}
