import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/helper/search.dart';
import 'package:vendor_list/models/company_model.dart';
import 'package:vendor_list/models/home/home_repositiory.dart';
import 'package:vendor_list/models/home/home_response.dart';
import 'package:vendor_list/models/info/info_repository.dart';
import 'package:vendor_list/models/info/info_response.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class Info extends StatefulWidget {
  final int comId;
  final String section;
final String myimg;
  const Info({@required this.comId, @required this.section,@required this.myimg});

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  InfoCompany company;
  List<Advert> ads = [];
  bool _loading = true;

  loadData() async {
    // for(int i=0;i<20;i++) {
    //   bool kk=await SharedPreferenceHelper.isSaved(myCom[i].companyName);
    //
    //   myCom[i].saved=kk;
    //   if(kk==true)SavedCompanies.saveCompany(myCom[i]);
    // }
    // InfoRepository infoRepository=new InfoRepository();
    company = await InfoRepository.getInfoCompany(widget.comId.toString());
    ads = await HomeRepository.getAds();
    print("hommmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmme" + company.toString());
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
    checkConnection();
    // TODO: implement initState
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool saved = false;
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
                          title:widget.section,
                          home: false,
                          language: language.getLanguage,
                        ),

                        ///appBar

                        ///InfoBody
                        _loading
                            ? Expanded(
                            child:
                            Center(child: Lottie.asset('assets/anm1.json')))
                            : myInfoBody(
                          company: company,
                          ads: ads,
                          myimg: widget.myimg,
                          language: language.getLanguage,
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
                          title:widget.section,
                          home: false,
                          language: language.getLanguage,
                        ),

                        ///appBar
                        ///InfoBody
                        _loading
                            ? Expanded(
                            child:
                            Center(child: Lottie.asset('assets/anm1.json')))
                            :  myInfoBody(
                          company: company,
                          ads: ads,
                          myimg: widget.myimg,
                          language: language.getLanguage,
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
