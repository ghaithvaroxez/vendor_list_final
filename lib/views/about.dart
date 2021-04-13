import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/models/about/about_repository.dart';
import 'package:vendor_list/models/about/about_response.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';



class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

About about;
  bool _loading = true;

  loadData() async {
    about=await AboutRepository.getAbout();

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
//                   showDialog(
//                       context: context,
//                       builder: ((context) => AlertDialog(
//                         title: english
//                             ? Text('Do yo want to change the language ?')
//                             : Text(
//                           'هل تريد تغير اللغة ؟',
//                           textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                         ),
//                         content: Container(
//                           height: MediaQuery.of(context).size.height / 8,
//                           child: Column(
//                             children: [
//                               english
//                                   ? Text('You are going to change application language')
//                                   : Text(
//                                 'أنت على وشك تغيير لغة التطبيق !!',
//                                 textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                               ),
//                               SizedBox(
//                                 height: MediaQuery.of(context).size.height / 64,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width / 4,
// // height: MediaQuery.of(context).size.height/32,
//                                       // height: MediaQuery.of(context).size.height/32,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(25),
//                                           color: Colors.green),
//
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           // exit(0);
//                                           // Navigator.of(context).pop(true);
//                                           language.changeLanguage();
//                                         },
//
//                                         child: Center(
//                                             child: english
//                                                 ? Text('Yes')
//                                                 : Text(
//                                               'نعم',
//                                               textDirection: TextDirection.rtl,
//                                             )),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width / 16,
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width / 4,
//                                       // height:MediaQuery.of(context).size.width/8,
//                                       // height: MediaQuery.of(context).size.height/16,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(25),
//                                           color: Colors.red),
//
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).pop();
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: Center(
//                                             child: english
//                                                 ? Text('No')
//                                                 : Text(
//                                               'لا',
//                                               textDirection: TextDirection.rtl,
//                                             )),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                       )
//                   );
                },
                language: language.getLanguage,
              )
              ,
              body: Builder(
                builder: (context) =>
                    SafeArea(
                      child: Column(
                        children: [

                          ///appBar
                          myAppBAr(
                            context: context,
                            title: "About",
                            home: false,
                            Search: false,
                            language: language.getLanguage,
                          ),

                          ///appBar

                          ///companyListBody
                          // mySavedCompanyListBody(section: "Saved Companies",context: context,),
                          /// companyListBody
                          _loading
                              ? Expanded(
                              child: Center(
                                child: Lottie.asset('assets/anm1.json'),
                              ))
                              : Expanded(
                            child: Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height/12),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: AutoSizeText(about.posts[0].title,minFontSize: 23,style: TextStyle(color: Colors.blue.withOpacity(0.6),fontWeight: FontWeight.bold),),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/12,),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: AutoSizeText(about.posts[0].body,minFontSize: 16,style: TextStyle(color: Colors.blue.withOpacity(0.6),fontWeight: FontWeight.w300),),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/12),
                                  iconLabel(
                                      context: context,
                                      image: 'assets/4/07.png',
                                      label: about.addresses[0].value,
                                      underLined: false,
                                      index: 2,
                                      color: false
                                      ,language: language.getLanguage),
                                  // AutoSizeText(,minFontSize: 12,style: TextStyle(color: Colors.blue.withOpacity(0.6),fontWeight: FontWeight.w300)),

                                ],
                              ),
                            )
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   itemCount: companies.length,
                            //   itemBuilder: (context, index) =>
                            //       cardButton(
                            //         context: context,
                            //         company: companies[index],
                            //         section: "Saved Companies",
                            //         s: false,
                            //         language: language.getLanguage,),
                            // ),
                          ),
                        ],
                      ),
                    ),
              ))
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
//                   showDialog(
//                       context: context,
//                       builder: ((context) => AlertDialog(
//                         title: english
//                             ? Text('Do yo want to change the language ?')
//                             : Text(
//                           'هل تريد تغير اللغة ؟',
//                           textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                         ),
//                         content: Container(
//                           height: MediaQuery.of(context).size.height / 8,
//                           child: Column(
//                             children: [
//                               english
//                                   ? Text('You are going to change application language')
//                                   : Text(
//                                 'أنت على وشك تغيير لغة التطبيق !!',
//                                 textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                               ),
//                               SizedBox(
//                                 height: MediaQuery.of(context).size.height / 64,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Expanded(
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width / 4,
// // height: MediaQuery.of(context).size.height/32,
//                                       // height: MediaQuery.of(context).size.height/32,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(25),
//                                           color: Colors.green),
//
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           // exit(0);
//                                           // Navigator.of(context).pop(true);
//                                           language.changeLanguage();
//                                         },
//
//                                         child: Center(
//                                             child: english
//                                                 ? Text('Yes')
//                                                 : Text(
//                                               'نعم',
//                                               textDirection: TextDirection.rtl,
//                                             )),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width / 16,
//                                   ),
//                                   Expanded(
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width / 4,
//                                       // height:MediaQuery.of(context).size.width/8,
//                                       // height: MediaQuery.of(context).size.height/16,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(25),
//                                           color: Colors.red),
//
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).pop();
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: Center(
//                                             child: english
//                                                 ? Text('No')
//                                                 : Text(
//                                               'لا',
//                                               textDirection: TextDirection.rtl,
//                                             )),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                       )
//                   );
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
                            title: "حول التطبيق",
                            home: false,
                            language: language.getLanguage,
                          ),

                          ///appBar

                          ///companyListBody
                          // mySavedCompanyListBody(section: widget.section,context: context,),
                          /// companyListBody
                          _loading
                              ? Expanded(
                              child: Center(
                                child: Lottie.asset('assets/anm1.json'),
                              ))
                              : Expanded(
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    SizedBox(height: MediaQuery.of(context).size.height/12),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: AutoSizeText(about.posts[0].title,minFontSize: 23,style: TextStyle(color: Colors.blue.withOpacity(0.6),fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/12,),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: AutoSizeText(about.posts[0].body,minFontSize: 16,style: TextStyle(color: Colors.blue.withOpacity(0.6),fontWeight: FontWeight.w300),),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height/12),
                                    iconLabel(
                                        context: context,
                                        image: 'assets/4/07.png',
                                        label: about.addresses[0].value,
                                        underLined: false,
                                        index: 2,
                                        color: false
                                        ,language: language.getLanguage),
                                    // AutoSizeText(,minFontSize: 12,style: TextStyle(color: Colors.blue.withOpacity(0.6),fontWeight: FontWeight.w300)),

                                  ],
                                ),
                              )
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   itemCount: companies.length,
                            //   itemBuilder: (context, index) =>
                            //       cardButton(
                            //         context: context,
                            //         company: companies[index],
                            //         section: "Saved Companies",
                            //         s: false,
                            //         language: language.getLanguage,),
                            // ),
                          ),
                        ],
                      ),
                    ),
              ));
        }
    );
  }
}
