import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/helper/sharedpref_helper.dart';
import 'package:vendor_list/models/company_model.dart';
import 'package:vendor_list/models/home/home_repositiory.dart';
import 'package:vendor_list/models/home/home_response.dart';
import 'package:vendor_list/models/vendors_search/vendors_search_response.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'companyList.dart';
import 'package:vendor_list/helper/saved.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  List<Vendor> vendors = [];

  loadData() async {
    // await Permission.;
    ///sharedPreferences
    // for(int i=0;i<20;i++) {
    //   bool kk=await SharedPreferenceHelper.isSaved(myCom[i].companyName);
    //
    //   myCom[i].saved=kk;
    //   if(kk==true)SavedCompanies.saveCompany(myCom[i]);
    // }
    ///sharedPreferences
    vendors = await HomeRepository.getVendors();
    print("hommmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmme" + vendors.toString());
    print("loadinggggggggggggggggggggg");
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
          builder: ((context) => Center(
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
              )));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: ((context) =>AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          title:  english
              ? Text('Are you sure ?')
              : Text(
            'هل أنت متأكد ؟', textDirection: TextDirection.rtl,
          ),
          content:  english
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
                'نعم',),
              onPressed: () {
                // language.changeLanguage();
                // Navigator.of(context).pop();
                exit(0);
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
  } Future<bool> _onChangeLanguage() {
    return showDialog(
        context: context,
        builder: ((context) => AlertDialog(
            title: english
                ? Text('Are you sure ?')
                : Text(
                    'هل أنت متأكد ؟',
                    textDirection: TextDirection.rtl,
                  ),
            content: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                children: [
                  english
                      ? Text('You are going to exit the application')
                      : Text(
                          'أنت على وشك إغلاق التطبيق !!',
                          textDirection: TextDirection.rtl,
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 64,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
// height: MediaQuery.of(context).size.height/32,
                          // height: MediaQuery.of(context).size.height/32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green),

                          child: GestureDetector(
                            onTap: () {
                              exit(0);
                              Navigator.of(context).pop(true);
                            },
                            child: Center(
                                child: english
                                    ? Text('Yes')
                                    : Text(
                                        'نعم',
                                        textDirection: TextDirection.rtl,
                                      )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 16,
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          // height:MediaQuery.of(context).size.width/8,
                          // height: MediaQuery.of(context).size.height/16,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.red),

                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Center(
                                child: english
                                    ? Text('No')
                                    : Text(
                                        'لا',
                                        textDirection: TextDirection.rtl,
                                      )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        )
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    checkConnection();
    loadData();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<Language>(
      builder: (context,Language language,child){
        return  language.getLanguage
            ? Scaffold(
          drawer: myDrawer(
            context: context,
            layer: 1,
            changeLanguage: () {
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
//               showDialog(
//                   context: context,
//                   builder: ((context) => AlertDialog(
//                     title: english
//                         ? Text('Do yo want to change the language ?')
//                         : Text(
//                       'هل تريد تغير اللغة ؟',
//                       textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                     ),
//                     content: Container(
//                       height: MediaQuery.of(context).size.height / 8,
//                       child: Column(
//                         children: [
//                           english
//                               ? Text('You are going to change application language')
//                               : Text(
//                             'أنت على وشك تغيير لغة التطبيق !!',
//                             textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 64,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width / 4,
// // height: MediaQuery.of(context).size.height/32,
//                                   // height: MediaQuery.of(context).size.height/32,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(25),
//                                       color: Colors.green),
//
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       // exit(0);
//                                       // Navigator.of(context).pop(true);
//                                       language.changeLanguage();
//                                     },
//
//                                     child: Center(
//                                         child: english
//                                             ? Text('Yes')
//                                             : Text(
//                                           'نعم',
//                                           textDirection: TextDirection.rtl,
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width / 16,
//                               ),
//                               Expanded(
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width / 4,
//                                   // height:MediaQuery.of(context).size.width/8,
//                                   // height: MediaQuery.of(context).size.height/16,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(25),
//                                       color: Colors.red),
//
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.of(context).pop();
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: Center(
//                                         child: english
//                                             ? Text('No')
//                                             : Text(
//                                           'لا',
//                                           textDirection: TextDirection.rtl,
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                   )
//               );

              // setState(() {
              //   if (english)
              //     english = false;
              //   else
              //     english = true;
              //
              //   print(english);
              // });
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
                        : myHomeBody(vendors,(){setState(() {
                      print("");
                    });})

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


              // showDialog(
              //     context: context,
              //     builder: ((context) => AlertDialog(
              //       title: english
              //           ? Text('Do yo want to change the language ?')
              //           : Text(
              //         'هل تريد تغير اللغة ؟',
              //         textDirection: english?TextDirection.rtl:TextDirection.ltr,
              //       ),
              //       content: Container(
              //         height: MediaQuery.of(context).size.height / 8,
              //         child: Column(
              //           children: [
              //             english
              //                 ? Text('You are going to change application language')
              //                 : Text(
              //               'أنت على وشك تغيير لغة التطبيق !!',
              //               textDirection: english?TextDirection.rtl:TextDirection.ltr,
              //             ),
              //             SizedBox(
              //               height: MediaQuery.of(context).size.height / 64,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Expanded(
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       // exit(0);
              //
              //                       language.changeLanguage();
              //                       Navigator.of(context).pop(true);
              //                     },
              //                     child: Container(
              //                       width: MediaQuery.of(context).size.width / 4,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(25),
              //                           color: Colors.green),
              //                       child: Center(
              //                           child: english
              //                               ? Text('Yes')
              //                               : Text(
              //                             'نعم',
              //                             textDirection: TextDirection.rtl,
              //                           )),
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: MediaQuery.of(context).size.width / 16,
              //                 ),
              //                 Expanded(
              //                   child: GestureDetector(
              //                     onTap: () {
              //                       Navigator.of(context).pop();
              //                       // Navigator.of(context).pop();
              //                     },
              //                     child: Container(
              //                       width: MediaQuery.of(context).size.width / 4,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(25),
              //                           color: Colors.red),
              //                       child: Center(
              //                           child: english
              //                               ? Text('No')
              //                               : Text(
              //                             'لا',
              //                             textDirection: TextDirection.rtl,
              //                           )),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     )
              //     )
              // );
              // setState(() {
              //   if (english)
              //     english = false;
              //   else
              //     english = true;
              //
              //   print(english);
              // });
            },
          language: language.getLanguage,),
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
                        : myHomeBody(vendors,(){setState(() {
                      print("");
                    });})

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
