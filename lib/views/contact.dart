import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/models/contact/contact_repositery.dart';
import 'package:vendor_list/models/contact/contact_response.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Social> socials = [];
  List<Contact> contacts = [];
  bool _loading = true;

  loadData() async {
    socials = await ContactRepositery.getSocial();
    contacts = await ContactRepositery.getContacts();
    setState(() {
      _loading = false;
    });
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
          builder: ((context) =>
              Center(
                child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 2,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 5,
                    decoration: BoxDecoration(
                      // color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(25)),
                    child: Center(
                      child: Lottie.asset(
                        'assets/wifi.json',
                      ),
                    )),
              )));
  }

  void initState() {
    // TODO: implement initState
    checkConnection();
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Language>(
        builder: (context, Language language, child) {
          return language.getLanguage
              ? Scaffold(
            drawer: myDrawer(
              context: context,
              layer: 3,
              changeLanguage: () {
                // setState(() {
                //   if (english)
                //     english = false;
                //   else
                //     english = true;
                //
                //   print(english);
                // });
                showDialog(
                    context: context,
                    builder: ((context) =>AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      title: english
                          ? Text('Do yo want to change the language ?')
                          : Text(
                        'هل تريد تغير اللغة ؟',
                        textDirection: english?TextDirection.rtl:TextDirection.ltr,
                      ),
                      content: english
                          ? Text('You are going to change application language')
                          : Text(
                        'أنت على وشك تغيير لغة التطبيق !!',
                        textDirection: english?TextDirection.rtl:TextDirection.ltr,
                      ),
                      actions: [
                        TextButton(
                          child: english
                              ? Text('Yes')
                              : Text(
                            'نعم',),
                          onPressed: () {
                            language.changeLanguage();
                            Navigator.of(context).pop();
                            // Navigator.popUntil(context, ModalRoute.withName('/'));
                          },
                        ),
                        TextButton(
                          child: english
                              ? Text('No')
                              : Text(
                              'لا'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )));
//                 showDialog(
//                     context: context,
//                     builder: ((context) => AlertDialog(
//                       title: english
//                           ? Text('Do yo want to change the language ?')
//                           : Text(
//                         'هل تريد تغير اللغة ؟',
//                         textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                       ),
//                       content: Container(
//                         height: MediaQuery.of(context).size.height / 8,
//                         child: Column(
//                           children: [
//                             english
//                                 ? Text('You are going to change application language')
//                                 : Text(
//                               'أنت على وشك تغيير لغة التطبيق !!',
//                               textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height / 64,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width / 4,
// // height: MediaQuery.of(context).size.height/32,
//                                     // height: MediaQuery.of(context).size.height/32,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Colors.green),
//
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         // exit(0);
//                                         // Navigator.of(context).pop(true);
//                                         language.changeLanguage();
//                                       },
//
//                                       child: Center(
//                                           child: english
//                                               ? Text('Yes')
//                                               : Text(
//                                             'نعم',
//                                             textDirection: TextDirection.rtl,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: MediaQuery.of(context).size.width / 16,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width / 4,
//                                     // height:MediaQuery.of(context).size.width/8,
//                                     // height: MediaQuery.of(context).size.height/16,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Colors.red),
//
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         Navigator.of(context).pop();
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Center(
//                                           child: english
//                                               ? Text('No')
//                                               : Text(
//                                             'لا',
//                                             textDirection: TextDirection.rtl,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                     )
//                 );
              },
              language: language.getLanguage,
            ),
            body: Builder(
              builder: (context) =>
                  SafeArea(
                    child: Column(
                      children: [

                        ///appBar
                        myAppBAr(
                          context: context,
                          title: "Contact",
                          home: false,
                          language: language.getLanguage,
                        ),

                        ///appBar

                        ///InfoBody
                        _loading
                            ? Expanded(
                            child:
                            Center(child: Lottie.asset('assets/anm1.json')))
                            : Builder(
                          builder: (context) =>
                              SafeArea(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          4 /
                                          32,
                                    ),

                                    ///InfoBody
                                    Container(
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                2 /
                                                32,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/1.png',
                                                  label: socials[0].link,
                                                  underLined: true,
                                                  index: 2,
                                                  color: true ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/2.png',
                                                  // label: "blablabla",
                                                  label: socials[1].link,
                                                  underLined: true,
                                                  index: 2,
                                                  color: true ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/3.png',
                                                  label: socials[2].link,
                                                  underLined: true,
                                                  index: 2,
                                                  color: true ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/4.png',
                                                  label: contacts[1].value,
                                                  underLined: true,
                                                  index: 3,
                                                  color: true ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/5.png',
                                                  label: contacts[0].value,
                                                  underLined: true,
                                                  index: 1,
                                                  color: true ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/6.png',
                                                  label: contacts[2].value,
                                                  underLined: true,
                                                  index: 1,
                                                  color: true ,language: language.getLanguage),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// InfoBody
                                  ],
                                  // 'assets/3/1.png'
                                ),
                              ),
                        ),

                        /// InfoBody
                      ],
                      // 'assets/3/1.png'
                    ),
                  ),
            ),
          )
              : Scaffold(
            endDrawer: myDrawer(
              context: context,
              layer: 3,
              changeLanguage: () {
                // setState(() {
                //   if (english)
                //     english = false;
                //   else
                //     english = true;
                //
                //   print(english);
                // });
                showDialog(
                    context: context,
                    builder: ((context) =>AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      title: english
                          ? Text('Do yo want to change the language ?')
                          : Text(
                        'هل تريد تغير اللغة ؟',
                        textDirection: english?TextDirection.rtl:TextDirection.ltr,
                      ),
                      content: english
                          ? Text('You are going to change application language')
                          : Text(
                        'أنت على وشك تغيير لغة التطبيق !!',
                        textDirection: english?TextDirection.rtl:TextDirection.ltr,
                      ),
                      actions: [
                        TextButton(
                          child: english
                              ? Text('Yes')
                              : Text(
                            'نعم',),
                          onPressed: () {
                            language.changeLanguage();
                            Navigator.of(context).pop();
                            // Navigator.popUntil(context, ModalRoute.withName('/'));
                          },
                        ),
                        TextButton(
                          child: english
                              ? Text('No')
                              : Text(
                              'لا'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )));
//                 showDialog(
//                     context: context,
//                     builder: ((context) => AlertDialog(
//                       title: english
//                           ? Text('Do yo want to change the language ?')
//                           : Text(
//                         'هل تريد تغير اللغة ؟',
//                         textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                       ),
//                       content: Container(
//                         height: MediaQuery.of(context).size.height / 8,
//                         child: Column(
//                           children: [
//                             english
//                                 ? Text('You are going to change application language')
//                                 : Text(
//                               'أنت على وشك تغيير لغة التطبيق !!',
//                               textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height / 64,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width / 4,
// // height: MediaQuery.of(context).size.height/32,
//                                     // height: MediaQuery.of(context).size.height/32,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Colors.green),
//
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         // exit(0);
//                                         // Navigator.of(context).pop(true);
//                                         language.changeLanguage();
//                                       },
//
//                                       child: Center(
//                                           child: english
//                                               ? Text('Yes')
//                                               : Text(
//                                             'نعم',
//                                             textDirection: TextDirection.rtl,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: MediaQuery.of(context).size.width / 16,
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width / 4,
//                                     // height:MediaQuery.of(context).size.width/8,
//                                     // height: MediaQuery.of(context).size.height/16,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(25),
//                                         color: Colors.red),
//
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         Navigator.of(context).pop();
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Center(
//                                           child: english
//                                               ? Text('No')
//                                               : Text(
//                                             'لا',
//                                             textDirection: TextDirection.rtl,
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                     )
//                 );
              },
              language: language.getLanguage,
            ),
            body: Builder(
              builder: (context) =>
                  SafeArea(
                    child: Column(
                      children: [

                        ///appBar
                        myAppBAr(
                          context: context,
                          title: "التواصل",
                          home: false,
                          language: language.getLanguage,
                        ),

                        ///appBar
                        ///InfoBody
                        _loading
                            ? Expanded(
                            child:
                            Center(child: Lottie.asset('assets/anm1.json')))
                            : Builder(
                          builder: (context) =>
                              SafeArea(
                                child: Column
                                  (
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          4 /
                                          32,
                                    ),

                                    ///InfoBody
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .end,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                8 /
                                                32,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/1.png',
                                                  label: socials[0].link,
                                                  underLined: true,
                                                  index: 2,
                                                  color: true
                                              ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/2.png',
                                                  // label: "blablabla",
                                                  label: socials[1].link,
                                                  underLined: true,
                                                  index: 2,
                                                  color: true
                                                  ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/3.png',
                                                  label: socials[2].link,
                                                  underLined: true,
                                                  index: 2,
                                                  color: true
                                                  ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/4.png',
                                                  label: contacts[1].value,
                                                  underLined: true,
                                                  index: 3,
                                                  color: true
                                                  ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/5.png',
                                                  label: contacts[0].value,
                                                  underLined: true,
                                                  index: 1,
                                                  color: true
                                                  ,language: language.getLanguage),
                                              SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height
                                                    /
                                                    32,
                                              ),
                                              iconLabel(
                                                  context: context,
                                                  image: 'assets/social/6.png',
                                                  label: contacts[2].value,
                                                  underLined: true,
                                                  index: 1,
                                                  color: true
                                                  ,language: language.getLanguage),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// InfoBody
                                  ],
                                  // 'assets/3/1.png'
                                ),
                              ),
                        ),

                        /// InfoBody
                      ],
                      // 'assets/3/1.png'
                    ),
                  ),
            ),
          );
        }
    );
  }
}
