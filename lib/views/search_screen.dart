import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/helper/search.dart';
import 'package:vendor_list/models/company_list/company_list_repository.dart';
import 'package:vendor_list/models/company_list/company_list_response.dart';
import 'package:vendor_list/models/company_model.dart';
import 'package:vendor_list/models/company_seearch/company_search_repository.dart';
import 'package:vendor_list/models/home/home_repositiory.dart';
import 'package:vendor_list/models/home/home_response.dart';
import 'package:vendor_list/models/vendors_search/vendors_search_repository.dart';
import 'package:vendor_list/models/vendors_search/vendors_search_response.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'info.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Company> companiess = [];
  List<Advert> ads = [];
  List<Vendor> vendorss = [];
  bool _loading = false;

  loadCompaniesData() async {
    setState(() {
      _loading = true;
    });
    companiess = [];
    companiess = await CompanySearchRepository.getSearchedCompany(query);
    print(companiess);
    // for(int i=0;i<20;i++) {
    //   bool kk=await SharedPreferenceHelper.isSaved(myCom[i].companyName);
    //
    //   myCom[i].saved=kk;
    //   if(kk==true)SavedCompanies.saveCompany(myCom[i]);
    // }
    // companies=await CompanyListRepository.getCompanies(widget.id);
    print("hommmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmme" + companiess.toString());
    // ads=await HomeRepository.getAds();
    // print("loadinggggggggggggggggggggg");
    setState(() {
      _loading = false;
    });
  }

  // loadVendorsData() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //
  //   vendorss = [];
  //   vendorss = await VendorSearchRepository.getSearchedVendors(query);
  //   print(vendorss);
  //   setState(() {
  //     _loading = false;
  //   });
  // }

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

  _onChanged() {
    setState(() {
      print(query + "44");
      if (_controller.text == "") {
        companiess = [];
        vendorss = [];
      }
      print("cleeeeeeeeeeeeeeear");
      query = _controller.text;

      print(query);
      if (_controller.text != "") {
        // if (dropDownValue == list[0])
          loadCompaniesData();
        // else
        //   loadVendorsData();
      }

      if (_controller.text == "") {
        companiess = [];
        vendorss = [];
      }
    });
    // email = value;
  }
  _onChanged_ar() {
    setState(() {
      print(query + "44");
      if (_controller_ar.text == "") {
        companiess = [];
        vendorss = [];
      }
      print("cleeeeeeeeeeeeeeear");
      query = _controller_ar.text;

      print(query);
      if (_controller_ar.text != "")
        // if (dropDownValue_ar == list_ar[0])
        loadCompaniesData();
      // else
      //   loadVendorsData();

      if (_controller_ar.text == "") {
        companiess = [];
        vendorss = [];
      }
    });
    // email = value;
  }

  void initState() {
    // TODO: implement initState
    checkConnection();
    _controller.addListener(_onChanged);
    _controller_ar.addListener(_onChanged_ar);
    super.initState();
  }

  // Refresh(String k) {
  //   setState(() {
  //     dropDownValue = k;
  //   });
  // }

  // Refresh_ar(String k) {
  //   setState(() {
  //     dropDownValue_ar = k;
  //
  //   });
  // }

  final _formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _controller_ar = TextEditingController();

  // final _formkey1 = GlobalKey<FormState>();
  // String dropDownValue = "Company";
  // String dropDownValue_ar = "الشركة";
  // List<String> list = ["Company", "Vendor"];
  // List<String> list_ar = ["الشركة", "البائع"];
  String query = "";

  @override
  Widget build(BuildContext context) {

    return Consumer<Language>(
        builder: (context, Language language, child) {
          return language.getLanguage
              ? Scaffold(
            drawer: myDrawer(
              context: context,
              layer: 2,
              changeLanguage: () {
                // setState(() {
                //   if (english)
                //     english = false;
                //   else
                //     english = true;
                //
                //   print(english);
                // });
                language.changeLanguage();
              },
              language: language.getLanguage,
            ),
            body: Builder(
              builder: (context) =>
                  SafeArea(
                    child: Column(
                      children: [

                        ///appBar
                        // myAppBAr(context: context,title: "Search",home: false,Search: true,),
                        ///appBar
                        ///
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF2EA5C3),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 16),
                              // dropDownValue == list[0]
                              //     ?
            AutoSizeText(
                                "Type Company Name ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 20,
                              ),
                              //     : AutoSizeText(
                              //   "Type Vendor Name",
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              //   minFontSize: 20,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // DropdownButton<String>(
                                  //   hint: Row(
                                  //     children: [
                                  //       SizedBox(width: 12,),
                                  //       Text(
                                  //         dropDownValue,
                                  //         textDirection: language.getLanguage ? TextDirection
                                  //             .ltr : TextDirection.rtl,
                                  //         style: TextStyle(
                                  //           color: Colors.white.withOpacity(
                                  //               0.8),
                                  //           fontWeight: FontWeight.w300,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  //   icon: const Icon(Icons.arrow_drop_down),
                                  //   iconSize: 24,
                                  //   onChanged: (String newValue) {
                                  //     setState(() {
                                  //       if (dropDownValue == list[0])
                                  //         Refresh(list[1]);
                                  //       else
                                  //         Refresh(list[0]);
                                  //     });
                                  //     ;
                                  //     print(dropDownValue);
                                  //   },
                                  //   items: list.map<DropdownMenuItem<String>>(
                                  //           (String value) {
                                  //         return DropdownMenuItem<String>(
                                  //           value: value,
                                  //           child: Text(value),
                                  //         );
                                  //       }).toList(),
                                  // ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width / 8,
                                    vertical:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height / 32),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: Form(
                                  key: _formkey,
                                  child: TextFormField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      hintText: "Company",
                                      border: InputBorder.none,
                                      icon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.search,
                                          color: Color(0xFF2EA5C3),
                                        ),
                                      ),
                                    ),
                                    // onChanged: (value) {
                                    //
                                    //   companiess=[];
                                    //   vendorss=[];
                                    //   print("cleeeeeeeeeeeeeeear");
                                    //   query=value;
                                    //   if(query!="") if(dropDownValue==list[0])
                                    //      loadCompaniesData();
                                    //     else   loadVendorsData();
                                    //
                                    //
                                    //   // email = value;
                                    // },
                                    validator: (val) {
                                      return val.isEmpty
                                          ? "Enter Company name"
                                          : null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///companyListBody
                        // dropDownValue == list[0]
                        //     ?
                        _loading
                            ? Expanded(
                            child: Center(
                              child: Lottie.asset('assets/anm1.json'),
                            ))
                            : mycompanyListBody(
                          section: "",
                          context: context,
                          companies: companiess,
                          ads: [],
                          language: language.getLanguage,
                        )

                        /// companyListBody
                        //     :
                        //
                        // ///HomeBody
                        // _loading
                        //     ? Expanded(
                        //     child: Center(
                        //       child: Lottie.asset('assets/anm1.json'),
                        //     ))
                        //     : myHomeBody(vendorss, () {
                        //   setState(() {
                        //
                        //   });
                        // })

                        /// HomeBody
                      ],
                    ),
                  ),
            ),
          )
              : Scaffold(
            endDrawer: myDrawer(
              context: context,
              layer: 2,
              changeLanguage: () {
                // setState(() {
                //   if (english)
                //     english = false;
                //   else
                //     english = true;
                //
                //   print(english);
                // });
                language.changeLanguage();
              },
              language: language.getLanguage,
            ),
            body: Builder(
              builder: (context) =>
                  SafeArea(
                    child: Column(
                      children: [

                        ///appBar
                        // myAppBAr(context: context,title: "Search",home: false,Search: true,),
                        ///appBar
                        ///
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF2EA5C3),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 16),
                              // dropDownValue_ar == list_ar[0]
                              //     ?
                              AutoSizeText(
                                "اكتب اسم الشركة",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 20,
                              ),
                              //     : AutoSizeText(
                              //   "اكتب اسم البائع",
                              //   textDirection: TextDirection.rtl,
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              //   minFontSize: 20,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // DropdownButton<String>(
                                  //   hint: Text(
                                  //     dropDownValue_ar,
                                  //     textDirection: TextDirection.rtl,
                                  //     style: TextStyle(
                                  //       color: Colors.white.withOpacity(0.8),
                                  //       fontWeight: FontWeight.w300,
                                  //     ),
                                  //   ),
                                  //   icon: const Icon(Icons.arrow_drop_down),
                                  //   iconSize: 24,
                                  //   onChanged: (String newValue) {
                                  //     companiess = [];
                                  //     vendorss = [];
                                  //     dropDownValue_ar = newValue;
                                  //     setState(() {
                                  //       if (dropDownValue_ar == list_ar[1])
                                  //         Refresh_ar(list_ar[1]);
                                  //       else
                                  //         Refresh_ar(list_ar[0]);
                                  //     });
                                  //
                                  //     print(dropDownValue_ar);
                                  //   },
                                  //   items: list_ar.map<
                                  //       DropdownMenuItem<String>>(
                                  //           (String value) {
                                  //         return DropdownMenuItem<String>(
                                  //           value: value,
                                  //           child: Text(
                                  //             value,
                                  //             textDirection: TextDirection.rtl,
                                  //           ),
                                  //         );
                                  //       }).toList(),
                                  // ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width / 8,
                                    vertical:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height / 32),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: TextFormField(
                                  controller: _controller_ar,
                                  decoration: InputDecoration(
                                    hintText: "  " + "الشركة" + "  ",
                                    hintTextDirection: TextDirection.rtl,
                                    border: InputBorder.none,
                                    icon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.search,
                                        color: Color(0xFF2EA5C3),
                                      ),
                                    ),
                                  ),
                                  // onChanged: (value) {
                                  //   companiess=[];
                                  //   vendorss=[];
                                  //   query=value;
                                  //   if(query!="")if(dropDownValue_ar==list_ar[0])
                                  //     loadCompaniesData();
                                  //   else   loadVendorsData();
                                  //
                                  //
                                  //   // email = value;
                                  // },
                                  validator: (val) {
                                    return val.isEmpty
                                        ? "ادخل اسم الشركة"
                                        : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///companyListBody
                        // dropDownValue_ar == list_ar[0]
                        //     ?
                        _loading
                            ? Expanded(
                            child: Center(
                              child: Lottie.asset('assets/anm1.json'),
                            ))
                            : mycompanyListBody(
                          section: "",
                          context: context,
                          companies: companiess,
                          ads: [],
                          language: language.getLanguage,
                        )

                        /// companyListBody
                        //     :
                        //
                        // ///HomeBody
                        // _loading
                        //     ? Expanded(
                        //     child: Center(
                        //       child: Lottie.asset('assets/anm1.json'),
                        //     ))
                        //     : myHomeBody(vendorss, () {
                        //   setState(() {
                        //
                        //   });
                        // })

                        /// HomeBody
                      ],
                    ),
                  ),
            ),
          );
        }
    );
  }
}
