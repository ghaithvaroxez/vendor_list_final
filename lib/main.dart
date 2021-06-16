import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/screens/home/view/home.dart';
import 'package:vendor_list/screens/splash/welcome_screen.dart';

import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  // AwesomeDialog(context: context,dialogType: DialogType.SUCCES,title: message.notification.title,body: Text(message.notification.body))..show();

  print("================================/nHandling a background message: ${message.messageId}/n============================================");
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Phoenix(child: MyApp()));

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool future = false;

  Future<void> _getFutureBool() {
    return Future.delayed(Duration(milliseconds: 3000))
        .then((onValue) => setState(() {

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
          fontFamily: 'Tajwal',
          primarySwatch: Colors.blue,
        ),
        home:
            !future == true ? WelcomeScreen() : Home(),
      ),
    );
  }
}
