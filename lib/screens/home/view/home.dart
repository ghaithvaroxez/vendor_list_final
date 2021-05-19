import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/helper/sharedpref_helper.dart';
import 'package:vendor_list/helper/token/token_repository.dart';
import 'package:vendor_list/widgets/Drawer.dart';
import 'components/home_body.dart';
import 'file:///C:/vendor_list/vendor_list/lib/screens/home/controller/home_repositiory.dart';
import 'package:vendor_list/screens/search/model/vendors_search_response.dart';
import 'package:vendor_list/widgets/app_bar.dart';

import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:vendor_list/helper/saved.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  List<Vendor> vendors = [];

  loadData() async {
    vendors = await HomeRepository.getVendors();
    print("hommmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmme" + vendors.toString());
    print("loadinggggggggggggggggggggg");
    setState(() {
      _loading = false;
    });
    // return true;
  }

  checkConnection() async {
    bool connected = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      connected = true;
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      connected = true;
      // I am connected to a wifi network.
    }
    if (!connected)
      showDialog(
          context: context,
          builder: ((context) => Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width - 5,
                          decoration: BoxDecoration(
                              // color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Lottie.asset(
                              'assets/wifi.json',
                            ),
                          )),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFF2EA5C3)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => Home())));
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.replay,
                                  size: 24,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                AutoSizeText(
                                  english ? 'Retry' : 'اعادة المحاولة ',
                                  maxLines: 1,
                                  style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white.withOpacity(0.8),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                  ],
                ),
              )));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              title: english
                  ? Text('Are you sure ?')
                  : Text(
                      'هل أنت متأكد ؟',
                      textDirection: TextDirection.rtl,
                    ),
              content: english
                  ? Text('You are going to exit the application')
                  : Text(
                      'أنت على وشك إغلاق التطبيق !!',
                      textDirection: TextDirection.rtl,
                    ),
              actions: [
                TextButton(
                  child: english
                      ? Text('Yes')
                      : Text(
                          'نعم',
                        ),
                  onPressed: () {
                    // language.changeLanguage();
                    // Navigator.of(context).pop();
                    exit(0);
                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                ),
                TextButton(
                  child: english ? Text('No') : Text('لا'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )));
//     return showDialog(
//         context: context,
//         builder: ((context) => AlertDialog(
//             title: english
//                 ? Text('Are you sure ?')
//                 : Text(
//                     'هل أنت متأكد ؟',
//                     textDirection: TextDirection.rtl,
//                   ),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 8,
//               child: Column(
//                 children: [
//                   english
//                       ? Text('You are going to exit the application')
//                       : Text(
//                           'أنت على وشك إغلاق التطبيق !!',
//                           textDirection: TextDirection.rtl,
//                         ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height / 64,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width / 4,
// // height: MediaQuery.of(context).size.height/32,
//                           // height: MediaQuery.of(context).size.height/32,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: Colors.green),
//
//                           child: GestureDetector(
//                             onTap: () {
//                               exit(0);
//                               Navigator.of(context).pop(true);
//                             },
//                             child: Center(
//                                 child: english
//                                     ? Text('Yes')
//                                     : Text(
//                                         'نعم',
//                                         textDirection: TextDirection.rtl,
//                                       )),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width / 16,
//                       ),
//                       Expanded(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width / 4,
//                           // height:MediaQuery.of(context).size.width/8,
//                           // height: MediaQuery.of(context).size.height/16,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25),
//                               color: Colors.red),
//
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).pop(false);
//                             },
//                             child: Center(
//                                 child: english
//                                     ? Text('No')
//                                     : Text(
//                                         'لا',
//                                         textDirection: TextDirection.rtl,
//                                       )),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ))));
  }

  Future<String> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  sendToken() async {
    TokenRepository.sendToken(await getToken());
  }

  @override
  void initState() {
    // TODO: implement initState

    checkConnection();
    sendToken();
    loadData();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification.body}');
      }
      AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          title: message.notification.title,
          body: Column(
            children: [
              Center(
                child: Text(
                  '${message.notification.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
              ),
              Text('${message.notification.body}',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14)),
            ],
          ))
        ..show();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Language>(
      builder: (context, Language language, child) {
        return language.getLanguage
            ? Scaffold(
                drawer: myDrawer(
                  context: context,
                  layer: 1,
                  changeLanguage: () {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              title: english
                                  ? Text('Do yo want to change the language ?')
                                  : Text(
                                      'هل تريد تغير اللغة ؟',
                                      textDirection: english
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                    ),
                              content: english
                                  ? Text(
                                      'You are going to change application language')
                                  : Text(
                                      'أنت على وشك تغيير لغة التطبيق !!',
                                      textDirection: english
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                    ),
                              actions: [
                                TextButton(
                                  child: english
                                      ? Text('Yes')
                                      : Text(
                                          'نعم',
                                        ),
                                  onPressed: () {
                                    language.changeLanguage();
                                    SharedPreferenceHelper.saveLanguage(
                                        language.getLanguage);
                                    Phoenix.rebirth(context);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: english ? Text('No') : Text('لا'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            )));
                  },
                  language: language.getLanguage,
                ),
                body: WillPopScope(
                  onWillPop: _onBackPressed,
                  child: Builder(
                    builder: (context) => SafeArea(
                      child: Column(
                        children: [
                          ///appBar
                          myAppBAr(
                            context: context,
                            home: true,
                            title: "Find a Vendor",
                            language: language.getLanguage,
                          ),

                          ///appBar
                          ///HomeBody
                          _loading
                              ? Expanded(
                                  child: Center(
                                  child: Lottie.asset('assets/anm1.json'),
                                ))
                              : myHomeBody(vendors, () {
                                  setState(() {
                                    print("");
                                  });
                                })

                          /// HomeBody
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                endDrawer: myDrawer(
                  context: context,
                  layer: 1,
                  changeLanguage: () {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              title: english
                                  ? Text('Do yo want to change the language ?')
                                  : Text(
                                      'هل تريد تغير اللغة ؟',
                                      textDirection: english
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                    ),
                              content: english
                                  ? Text(
                                      'You are going to change application language')
                                  : Text(
                                      'أنت على وشك تغيير لغة التطبيق !!',
                                      textDirection: english
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                    ),
                              actions: [
                                TextButton(
                                  child: english
                                      ? Text('Yes')
                                      : Text(
                                          'نعم',
                                        ),
                                  onPressed: () {
                                    language.changeLanguage();
                                    SharedPreferenceHelper.saveLanguage(
                                        language.getLanguage);
                                    Phoenix.rebirth(context);
                                    Navigator.of(context).pop();
                                    // Navigator.popUntil(context, ModalRoute.withName('/'));
                                  },
                                ),
                                TextButton(
                                  child: english ? Text('No') : Text('لا'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            )));
                  },
                  language: language.getLanguage,
                ),
                body:

                    // _loading?Container(child: Center(child: CircularProgressIndicator(),),):
                    WillPopScope(
                  onWillPop: _onBackPressed,
                  child: Builder(
                    builder: (context) => SafeArea(
                      child: Column(
                        children: [
                          ///appBar
                          myAppBAr(
                            context: context,
                            home: true,
                            title: "ابحث عن بائع",
                            language: language.getLanguage,
                          ),

                          ///appBar
                          ///HomeBody
                          _loading
                              ? Expanded(
                                  child: Center(
                                  child: Lottie.asset('assets/anm1.json'),
                                ))
                              : myHomeBody(vendors, () {
                                  setState(() {
                                    print("");
                                  });
                                })

                          /// HomeBody
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
