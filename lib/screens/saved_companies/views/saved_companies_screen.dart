import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/get_image/get_image.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/helper/saved.dart';
import 'package:vendor_list/helper/sharedpref_helper.dart';
import 'package:vendor_list/screens/company_list/model/company_list_response.dart';
import 'package:vendor_list/screens/company_list/view/components/card_button.dart';
import 'package:vendor_list/screens/info/controller/info_repository.dart';
import 'package:vendor_list/screens/info/model/info_response.dart';
import 'package:vendor_list/widgets/Drawer.dart';
import 'package:vendor_list/widgets/app_bar.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SavedCompaniesScreen extends StatefulWidget {
  SavedCompaniesScreen(this.section);

  String section;

  @override
  _SavedCompaniesScreenState createState() => _SavedCompaniesScreenState();
}

class _SavedCompaniesScreenState extends State<SavedCompaniesScreen> {
  bool _loading = true;

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
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
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
                    ),
                    Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 14,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFF2EA5C3)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        SavedCompaniesScreen(
                                  widget.section
                                        ))));
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
                                  english?'Retry':'اعادة المحاولة ',
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 8,
                    ),
                  ],
                ),
              )));
  }

  List<Company> companies = [];

  loadData() async {
    companies.clear();
    List<String> company_id = [];
    company_id = await SharedPreferenceHelper.getStoredData();
    for (int i = 1; i < company_id.length; i++) {
      InfoCompany infoCompany =
      await InfoRepository.getInfoCompany(company_id[i]);
      infoCompany.logo=await GetImage.getCompanyImage(infoCompany.vendorId, infoCompany.id);
      companies.add(infoCompany.toCompany());
    }
    for (int i = 0; i < companies.length; i++)
      companies[i].saved = true;
    setState(() {
      _loading = false;
    });

    ///sharedPreferences
    // for(int i=0;i<20;i++) {
    //   bool kk=await SharedPreferenceHelper.isSaved(myCom[i].companyName);
    //
    //   myCom[i].saved=kk;
    //   if(kk==true)SavedCompanies.saveCompany(myCom[i]);
    // }
    ///sharedPreferences
  }

  @override
  void initState() {
    checkConnection();
    loadData();
    // TODO: implement initState
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
                              SharedPreferenceHelper.saveLanguage(language.getLanguage);
                              Phoenix.rebirth(context);
                              // setState(() {
                              //   _loading=true;
                              //   loadData();
                              // });
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
                            title: "Saved Companies",
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
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: companies.length,
                              itemBuilder: (context, index) =>
                                  cardButton(
                                      context: context,
                                      company: companies[index],
                                      section: "Saved Companies",
                                      s: false,
                                  language: language.getLanguage,),
                            ),
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
                              SharedPreferenceHelper.saveLanguage(language.getLanguage);
                              Phoenix.rebirth(context);
                              // setState(() {
                              //   _loading=true;
                              //   loadData();
                              // });
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
                            title: "الشركات المحفوظة",
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
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: companies.length,
                              itemBuilder: (context, index) =>
                                  cardButton(
                                      context: context,
                                      company: companies[index],
                                      section: "الشركات المحفوظة",
                                      s: false
                                  ,language: language.getLanguage,),
                            ),
                          ),
                        ],
                      ),
                    ),
              ));
        }
    );
  }
}
