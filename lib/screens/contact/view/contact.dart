import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/language_helper.dart';
import 'package:vendor_list/helper/sharedpref_helper.dart';
import 'package:vendor_list/screens/contact/controller/contact_repositery.dart';
import 'package:vendor_list/screens/contact/model/contact_response.dart';
import 'package:vendor_list/screens/info/view/components/icon_label.dart';
import 'package:vendor_list/widgets/Drawer.dart';
import 'package:vendor_list/widgets/app_bar.dart';
import 'package:vendor_list/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Social> socials = [];
  List<Contact> contacts = [];
  List<Address> address = [];
  bool _loading = true;

  loadData() async {
    socials.clear();
    contacts.clear();
    address.clear();

    socials = await ContactRepositery.getSocial();
    contacts = await ContactRepositery.getContactData();
    address = await ContactRepositery.getAddresses();
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
                                        ContactScreen(

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

          return
            language.getLanguage
              ?
          Scaffold(
            drawer: myDrawer
              (
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
                          title: language.getLanguage?"Contact":"التواصل",
                          home: false,
                          language: language.getLanguage,
                        ),

                        ///appBar

                        ///InfoBody
                        _loading
                            ? Expanded(
                            child:
                            Center(child: Lottie.asset('assets/anm1.json')))
                            :

                              Expanded(
                                // width: MediaQuery.of(context).size.width,
                                // height: MediaQuery.of(context).size.height*7/8,
                                child: ListView(
shrinkWrap: true,
                                  children: [
                                    SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height *
                                          2 /
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
                                              ///facebook
                                              for(int i=0;i<socials.length;i++)
                                              socials[i].type=="facebook"?Column(
                                                children: [
                                                  iconLabel(
                                                      context: context,
                                                      image: 'assets/social/facebook.png',
                                                      label: socials[i].link,
                                                      underLined: true,
                                                      index: 2,
                                                      color: true ,language: language.getLanguage),

                                                  Flexible(
                                                    child: SizedBox(
                                                      height: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .height
                                                          /
                                                          32,
                                                    ),
                                                  ),
                                                ],
                                              ):Container(),

                                              ///twitter
                                              for(int i=0;i<socials.length;i++)
                                                socials[i].type=="twitter"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/twitter.png',
                                                        label: socials[i].link,
                                                        underLined: true,
                                                        index: 2,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),

                                              ///instagram
                                              for(int i=0;i<socials.length;i++)
                                                socials[i].type=="instagram"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/instagram.png',
                                                        label: socials[i].link,
                                                        underLined: true,
                                                        index: 2,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),

                                                  ],
                                                ):Container(),

                                              ///linkedin
                                              for(int i=0;i<socials.length;i++)
                                                socials[i].type=="linkedin"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/linkedin.png',
                                                        label: socials[i].link,
                                                        underLined: true,
                                                        index: 2,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),

                                              ///snapchat
                                              for(int i=0;i<socials.length;i++)
                                                socials[i].type=="snapchat"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/snapchat.png',
                                                        label: socials[i].link,
                                                        underLined: true,
                                                        index: 2,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),


                                              ///youtube
                                              for(int i=0;i<socials.length;i++)
                                                socials[i].type=="youtube"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/youtube.png',
                                                        label: socials[i].link,
                                                        underLined: true,
                                                        index: 2,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),

///email
                                              for(int i=0;i<contacts.length;i++)
                                                contacts[i].type=="email"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/email.png',
                                                        label: contacts[i].value,
                                                        underLined: true,
                                                        index: 3,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),
///mobile
                                              for(int i=0;i<contacts.length;i++)
                                                contacts[i].type=="mobile"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/mobile.png',
                                                        label: contacts[i].value,
                                                        underLined: true,
                                                        index: 1,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),
///phone
                                              for(int i=0;i<contacts.length;i++)
                                                contacts[i].type=="phone"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/phone.png',
                                                        label: contacts[i].value,
                                                        underLined: true,
                                                        index: 1,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),
                                              ///fax
                                              for(int i=0;i<contacts.length;i++)
                                                contacts[i].type=="fax"?Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/fax.png',
                                                        label: contacts[i].value,
                                                        underLined: true,
                                                        index: 1,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ):Container(),

///adresses
                                              for(int i=0;i<address.length;i++)
                                                Column(
                                                  children: [
                                                    iconLabel(
                                                        context: context,
                                                        image: 'assets/social/location.png',
                                                        label: address[i].value,
                                                        underLined: true,
                                                        index: -1,
                                                        color: true ,language: language.getLanguage),
                                                    Flexible(
                                                      child: SizedBox(
                                                        height: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .height
                                                            /
                                                            32,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ///end


                                            ],
                                          ),
                                        ],
                                      ),
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
          )
          :
            Scaffold(
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
                            title: language.getLanguage?"Contact":"التواصل",
                            home: false,
                            language: language.getLanguage,
                          ),

                          ///appBar

                          ///InfoBody
                          _loading
                              ? Expanded(
                              child:
                              Center(child: Lottie.asset('assets/anm1.json')))
                              :
                          Builder(
                            builder: (context) =>
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*7/8,
                                  child: ListView(
                                    shrinkWrap: true,

                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                2 /
                                                32,
                                          ),

                                          ///InfoBody
                                          Container(
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                Flexible(
                                                  child: SizedBox(
                                                    width: MediaQuery
                                                        .of(context)
                                                        .size
                                                        .width *
                                                        2 /
                                                        32,
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                                  children: [
                                                    ///facebook
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="facebook"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/facebook.png',
                                                              label: socials[i].link,
                                                              underLined: true,
                                                              index: 2,
                                                              color: true ,language: language.getLanguage),

                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),

                                                    ///twitter
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="twitter"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/twitter.png',
                                                              label: socials[i].link,
                                                              underLined: true,
                                                              index: 2,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),

                                                    ///instagram
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="instagram"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/instagram.png',
                                                              label: socials[i].link,
                                                              underLined: true,
                                                              index: 2,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),

                                                        ],
                                                      ):Container(),

                                                    ///linkedin
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="linkedin"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/linkedin.png',
                                                              label: socials[i].link,
                                                              underLined: true,
                                                              index: 2,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),

                                                    ///snapchat
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="snapchat"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/snapchat.png',
                                                              label: socials[i].link,
                                                              underLined: true,
                                                              index: 2,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),


                                                    ///youtube
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="youtube"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/youtube.png',
                                                              label: socials[i].link,
                                                              underLined: true,
                                                              index: 2,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),

                                                    ///email
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="email"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/email.png',
                                                              label: contacts[i].value,
                                                              underLined: true,
                                                              index: 3,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),
                                                    ///mobile
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="mobile"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/mobile.png',
                                                              label: contacts[i].value,
                                                              underLined: true,
                                                              index: 1,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),
                                                    ///phone
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="phone"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/phone.png',
                                                              label: contacts[i].value,
                                                              underLined: true,
                                                              index: 1,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),
                                                    ///fax
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="fax"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/fax.png',
                                                              label: contacts[i].value,
                                                              underLined: true,
                                                              index: 1,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ):Container(),

                                                    ///adresses
                                                    for(int i=0;i<address.length;i++)
                                                      Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/location.png',
                                                              label: address[i].value,
                                                              underLined: true,
                                                              index: -1,
                                                              color: true ,language: language.getLanguage),
                                                          Flexible(
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                  .of(context)
                                                                  .size
                                                                  .height
                                                                  /
                                                                  32,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ///end


                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                          /// InfoBody
                                        ],
                                        // 'assets/3/1.png'
                                      ),
                                    ],
                                  ),
                                ),
                          ),

                          /// InfoBody
                        ],
                        // 'assets/3/1.png'
                      ),
                    ),
              ),

              /*
              Builder(
                builder: (context) =>
                    SafeArea(
                      child: Column(
                        children: [

                          ///appBar
                          myAppBAr(
                            context: context,
                            title: language.getLanguage?"Contact":"التواصل",
                            screens.home: false,
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
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height*6/8,
                                  child: ListView(
                                    shrinkWrap: true,

                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                2 /
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
                                                    ///facebook
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="facebook"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/facebook.png',
                                                              label: socials[i].link,
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
                                                        ],
                                                      ):Container(),

                                                    ///twitter
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="twitter"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/twitter.png',
                                                              label: socials[i].link,
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
                                                        ],
                                                      ):Container(),

                                                    ///instagram
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="instagram"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/instagram.png',
                                                              label: socials[i].link,
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

                                                        ],
                                                      ):Container(),

                                                    ///linkedin
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="linkedin"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/linkedin.png',
                                                              label: socials[i].link,
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
                                                        ],
                                                      ):Container(),

                                                    ///snapchat
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="snapchat"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/snapchat.png',
                                                              label: socials[i].link,
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
                                                        ],
                                                      ):Container(),


                                                    ///youtube
                                                    for(int i=0;i<socials.length;i++)
                                                      socials[i].type=="youtube"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/youtube.png',
                                                              label: socials[i].link,
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
                                                        ],
                                                      ):Container(),

                                                    ///email
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="email"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/email.png',
                                                              label: contacts[i].value,
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
                                                        ],
                                                      ):Container(),
                                                    ///mobile
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="mobile"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/mobile.png',
                                                              label: contacts[i].value,
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
                                                        ],
                                                      ):Container(),
                                                    ///phone
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="phone"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/phone.png',
                                                              label: contacts[i].value,
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
                                                        ],
                                                      ):Container(),
                                                    ///fax
                                                    for(int i=0;i<contacts.length;i++)
                                                      contacts[i].type=="fax"?Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/fax.png',
                                                              label: contacts[i].value,
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
                                                        ],
                                                      ):Container(),

                                                    ///adresses
                                                    for(int i=0;i<address.length;i++)
                                                      Column(
                                                        children: [
                                                          iconLabel(
                                                              context: context,
                                                              image: 'assets/social/location.png',
                                                              label: address[i].value,
                                                              underLined: true,
                                                              index: -1,
                                                              color: true ,language: language.getLanguage),
                                                          SizedBox(
                                                            height: MediaQuery
                                                                .of(context)
                                                                .size
                                                                .height
                                                                /
                                                                32,
                                                          ),
                                                        ],
                                                      ),
                                                    ///end


                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),

                                          /// InfoBody
                                        ],
                                        // 'assets/3/1.png'
                                      ),
                                    ],
                                  ),
                                ),
                          ),

                          /// InfoBody
                        ],
                        // 'assets/3/1.png'
                      ),
                    ),
              ),
              */
            );

                //kk
//           Scaffold(
//             endDrawer: myDrawer(
//               context: context,
//               layer: 3,
//               changeLanguage: () {
//                 // setState(() {
//                 //   if (english)
//                 //     english = false;
//                 //   else
//                 //     english = true;
//                 //
//                 //   print(english);
//                 // });
//                 showDialog(
//                     context: context,
//                     builder: ((context) =>AlertDialog(
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                       title: english
//                           ? Text('Do yo want to change the language ?')
//                           : Text(
//                         'هل تريد تغير اللغة ؟',
//                         textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                       ),
//                       content: english
//                           ? Text('You are going to change application language')
//                           : Text(
//                         'أنت على وشك تغيير لغة التطبيق !!',
//                         textDirection: english?TextDirection.rtl:TextDirection.ltr,
//                       ),
//                       actions: [
//                         TextButton(
//                           child: english
//                               ? Text('Yes')
//                               : Text(
//                             'نعم',),
//                           onPressed: () {
//                             language.changeLanguage();
//                             SharedPreferenceHelper.saveLanguage(language.getLanguage);
//                             Phoenix.rebirth(context);
//                             // setState(() {
//                             //   _loading=true;
//                             //   loadData();
//                             // });
//                             Navigator.of(context).pop();
//                             // Navigator.popUntil(context, ModalRoute.withName('/'));
//                           },
//                         ),
//                         TextButton(
//                           child: english
//                               ? Text('No')
//                               : Text(
//                               'لا'),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         )
//                       ],
//                     )));
// //                 showDialog(
// //                     context: context,
// //                     builder: ((context) => AlertDialog(
// //                       title: english
// //                           ? Text('Do yo want to change the language ?')
// //                           : Text(
// //                         'هل تريد تغير اللغة ؟',
// //                         textDirection: english?TextDirection.rtl:TextDirection.ltr,
// //                       ),
// //                       content: Container(
// //                         height: MediaQuery.of(context).size.height / 8,
// //                         child: Column(
// //                           children: [
// //                             english
// //                                 ? Text('You are going to change application language')
// //                                 : Text(
// //                               'أنت على وشك تغيير لغة التطبيق !!',
// //                               textDirection: english?TextDirection.rtl:TextDirection.ltr,
// //                             ),
// //                             SizedBox(
// //                               height: MediaQuery.of(context).size.height / 64,
// //                             ),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Expanded(
// //                                   child: Container(
// //                                     width: MediaQuery.of(context).size.width / 4,
// // // height: MediaQuery.of(context).size.height/32,
// //                                     // height: MediaQuery.of(context).size.height/32,
// //                                     decoration: BoxDecoration(
// //                                         borderRadius: BorderRadius.circular(25),
// //                                         color: Colors.green),
// //
// //                                     child: GestureDetector(
// //                                       onTap: () {
// //                                         // exit(0);
// //                                         // Navigator.of(context).pop(true);
// //                                         language.changeLanguage();
// //                                       },
// //
// //                                       child: Center(
// //                                           child: english
// //                                               ? Text('Yes')
// //                                               : Text(
// //                                             'نعم',
// //                                             textDirection: TextDirection.rtl,
// //                                           )),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 SizedBox(
// //                                   width: MediaQuery.of(context).size.width / 16,
// //                                 ),
// //                                 Expanded(
// //                                   child: Container(
// //                                     width: MediaQuery.of(context).size.width / 4,
// //                                     // height:MediaQuery.of(context).size.width/8,
// //                                     // height: MediaQuery.of(context).size.height/16,
// //                                     decoration: BoxDecoration(
// //                                         borderRadius: BorderRadius.circular(25),
// //                                         color: Colors.red),
// //
// //                                     child: GestureDetector(
// //                                       onTap: () {
// //                                         Navigator.of(context).pop();
// //                                         Navigator.of(context).pop();
// //                                       },
// //                                       child: Center(
// //                                           child: english
// //                                               ? Text('No')
// //                                               : Text(
// //                                             'لا',
// //                                             textDirection: TextDirection.rtl,
// //                                           )),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     )
// //                     )
// //                 );
//               },
//               language: language.getLanguage,
//             ),
//             body: Builder(
//               builder: (context) =>
//                   SafeArea(
//                     child: Column(
//                       children: [
//
//                         ///appBar
//                         myAppBAr(
//                           context: context,
//                           title: "التواصل",
//                           screens.home: false,
//                           language: language.getLanguage,
//                         ),
//
//                         ///appBar
//
//                         ///InfoBody
//                         _loading
//                             ? Expanded(
//                             child:
//                             Center(child: Lottie.asset('assets/anm1.json')))
//                             :
//                         Builder(
//                           builder: (context) =>
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 height: MediaQuery.of(context).size.height*6/8,
//                                 child: ListView(
//                                   shrinkWrap: true,
//
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.end,
//                                       children: [
//                                         SizedBox(
//                                           height: MediaQuery
//                                               .of(context)
//                                               .size
//                                               .height *
//                                               2 /
//                                               32,
//                                         ),
//
//                                         ///InfoBody
//                                         Container(
//                                           child: Row(
//                                             // mainAxisAlignment: MainAxisAlignment.start,
//                                             mainAxisAlignment: MainAxisAlignment
//                                                 .end,
//                                             children: [
//                                               SizedBox(
//                                                 width: MediaQuery
//                                                     .of(context)
//                                                     .size
//                                                     .width *
//                                                     2 /
//                                                     32,
//                                               ),
//                                               Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                                 children: [
//                                                   ///facebook
//                                                   for(int i=0;i<socials.length;i++)
//                                                     socials[i].type=="facebook"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/facebook.png',
//                                                             label: socials[i].link,
//                                                             underLined: true,
//                                                             index: 2,
//                                                             color: true ,language: language.getLanguage),
//
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//
//                                                   ///twitter
//                                                   for(int i=0;i<socials.length;i++)
//                                                     socials[i].type=="twitter"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/twitter.png',
//                                                             label: socials[i].link,
//                                                             underLined: true,
//                                                             index: 2,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//
//                                                   ///instagram
//                                                   for(int i=0;i<socials.length;i++)
//                                                     socials[i].type=="instagram"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/instagram.png',
//                                                             label: socials[i].link,
//                                                             underLined: true,
//                                                             index: 2,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//
//                                                       ],
//                                                     ):Container(),
//
//                                                   ///linkedin
//                                                   for(int i=0;i<socials.length;i++)
//                                                     socials[i].type=="linkedin"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/linkedin.png',
//                                                             label: socials[i].link,
//                                                             underLined: true,
//                                                             index: 2,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//
//                                                   ///snapchat
//                                                   for(int i=0;i<socials.length;i++)
//                                                     socials[i].type=="snapchat"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/snapchat.png',
//                                                             label: socials[i].link,
//                                                             underLined: true,
//                                                             index: 2,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//
//
//                                                   ///youtube
//                                                   for(int i=0;i<socials.length;i++)
//                                                     socials[i].type=="youtube"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/youtube.png',
//                                                             label: socials[i].link,
//                                                             underLined: true,
//                                                             index: 2,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//
//                                                   ///email
//                                                   for(int i=0;i<contacts.length;i++)
//                                                     contacts[i].type=="email"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/email.png',
//                                                             label: contacts[i].value,
//                                                             underLined: true,
//                                                             index: 3,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//                                                   ///mobile
//                                                   for(int i=0;i<contacts.length;i++)
//                                                     contacts[i].type=="mobile"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/mobile.png',
//                                                             label: contacts[i].value,
//                                                             underLined: true,
//                                                             index: 1,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//                                                   ///phone
//                                                   for(int i=0;i<contacts.length;i++)
//                                                     contacts[i].type=="phone"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/phone.png',
//                                                             label: contacts[i].value,
//                                                             underLined: true,
//                                                             index: 1,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//                                                   ///fax
//                                                   for(int i=0;i<contacts.length;i++)
//                                                     contacts[i].type=="fax"?Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/fax.png',
//                                                             label: contacts[i].value,
//                                                             underLined: true,
//                                                             index: 1,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ):Container(),
//
//                                                   ///adresses
//                                                   for(int i=0;i<address.length;i++)
//                                                     Column(
//                                                       children: [
//                                                         iconLabel(
//                                                             context: context,
//                                                             image: 'assets/social/location.png',
//                                                             label: address[i].value,
//                                                             underLined: true,
//                                                             index: -1,
//                                                             color: true ,language: language.getLanguage),
//                                                         SizedBox(
//                                                           height: MediaQuery
//                                                               .of(context)
//                                                               .size
//                                                               .height
//                                                               /
//                                                               32,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ///end
//
//
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//
//                                         /// InfoBody
//                                       ],
//                                       // 'assets/3/1.png'
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                         ),
//                             //old
//                         //     : Builder(
//                         //   builder: (context) =>
//                         //       Container(
//                         //         width: MediaQuery.of(context).size.width,
//                         //         height: MediaQuery.of(context).size.height*6/8,
//                         //         child:ListView(
//                         //           shrinkWrap: true,
//                         //
//                         //           children: [
//                         //             Column(
//                         //               crossAxisAlignment: CrossAxisAlignment.end,
//                         //               children: [
//                         //                 SizedBox(
//                         //                   height: MediaQuery
//                         //                       .of(context)
//                         //                       .size
//                         //                       .height *
//                         //                       2 /
//                         //                       32,
//                         //                 ),
//                         //
//                         //                 ///InfoBody
//                         //                 Container(
//                         //                   child: Row(
//                         //                     // mainAxisAlignment: MainAxisAlignment.start,
//                         //                     mainAxisAlignment: MainAxisAlignment
//                         //                         .end,
//                         //                     children: [
//                         //                       SizedBox(
//                         //                         width: MediaQuery
//                         //                             .of(context)
//                         //                             .size
//                         //                             .width *
//                         //                             2 /
//                         //                             32,
//                         //                       ),
//                         //                       Column(
//                         //                         crossAxisAlignment:
//                         //                         CrossAxisAlignment.end,
//                         //                         children: [
//                         //                           ///facebook
//                         //                           for(int i=0;i<socials.length;i++)
//                         //                             socials[i].type=="facebook"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/facebook.png',
//                         //                                     label: socials[i].link,
//                         //                                     underLined: true,
//                         //                                     index: 2,
//                         //                                     color: true ,language: language.getLanguage),
//                         //
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //
//                         //                           ///twitter
//                         //                           for(int i=0;i<socials.length;i++)
//                         //                             socials[i].type=="twitter"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/twitter.png',
//                         //                                     label: socials[i].link,
//                         //                                     underLined: true,
//                         //                                     index: 2,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //
//                         //                           ///instagram
//                         //                           for(int i=0;i<socials.length;i++)
//                         //                             socials[i].type=="instagram"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/instagram.png',
//                         //                                     label: socials[i].link,
//                         //                                     underLined: true,
//                         //                                     index: 2,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //
//                         //                               ],
//                         //                             ):Container(),
//                         //
//                         //                           ///linkedin
//                         //                           for(int i=0;i<socials.length;i++)
//                         //                             socials[i].type=="linkedin"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/linkedin.png',
//                         //                                     label: socials[i].link,
//                         //                                     underLined: true,
//                         //                                     index: 2,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //
//                         //                           ///snapchat
//                         //                           for(int i=0;i<socials.length;i++)
//                         //                             socials[i].type=="snapchat"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/snapchat.png',
//                         //                                     label: socials[i].link,
//                         //                                     underLined: true,
//                         //                                     index: 2,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //
//                         //
//                         //                           ///youtube
//                         //                           for(int i=0;i<socials.length;i++)
//                         //                             socials[i].type=="youtube"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/youtube.png',
//                         //                                     label: socials[i].link,
//                         //                                     underLined: true,
//                         //                                     index: 2,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //
//                         //                           ///email
//                         //                           for(int i=0;i<contacts.length;i++)
//                         //                             contacts[i].type=="email"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/email.png',
//                         //                                     label: contacts[i].value,
//                         //                                     underLined: true,
//                         //                                     index: 3,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //                           ///mobile
//                         //                           for(int i=0;i<contacts.length;i++)
//                         //                             contacts[i].type=="mobile"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/mobile.png',
//                         //                                     label: contacts[i].value,
//                         //                                     underLined: true,
//                         //                                     index: 1,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //                           ///phone
//                         //                           for(int i=0;i<contacts.length;i++)
//                         //                             contacts[i].type=="phone"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/phone.png',
//                         //                                     label: contacts[i].value,
//                         //                                     underLined: true,
//                         //                                     index: 1,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //                           ///fax
//                         //                           for(int i=0;i<contacts.length;i++)
//                         //                             contacts[i].type=="fax"?Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/fax.png',
//                         //                                     label: contacts[i].value,
//                         //                                     underLined: true,
//                         //                                     index: 1,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ):Container(),
//                         //
//                         //                           ///adresses
//                         //                           for(int i=0;i<address.length;i++)
//                         //                             Column(
//                         //                               children: [
//                         //                                 iconLabel(
//                         //                                     context: context,
//                         //                                     image: 'assets/social/location.png',
//                         //                                     label: address[i].value,
//                         //                                     underLined: true,
//                         //                                     index: -1,
//                         //                                     color: true ,language: language.getLanguage),
//                         //                                 SizedBox(
//                         //                                   height: MediaQuery
//                         //                                       .of(context)
//                         //                                       .size
//                         //                                       .height
//                         //                                       /
//                         //                                       32,
//                         //                                 ),
//                         //                               ],
//                         //                             ),
//                         //                           ///end
//                         //
//                         //
//                         //                         ],
//                         //                       ),
//                         //                     ],
//                         //                   ),
//                         //                 ),
//                         //
//                         //                 /// InfoBody
//                         //               ],
//                         //               // 'assets/3/1.png'
//                         //             ),
//                         //           ],
//                         //         ),
//                         //       ),
//                         // ),
//
//                         /// InfoBody
//                       ],
//                       // 'assets/3/1.png'
//                     ),
//                   ),
//             ),
//           )
            //kk
          ;
        }
    );
  }
}
