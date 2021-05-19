import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:vendor_list/helper/saved.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:string_scanner/string_scanner.dart' as str;
import 'package:vendor_list/helper/sharedpref_helper.dart';
import 'package:vendor_list/screens/about/view/about.dart';
import 'package:vendor_list/screens/company_list/model/company_list_response.dart';
import 'package:vendor_list/screens/company_list/view/companyList.dart';
import 'package:vendor_list/screens/contact/view/contact.dart';
import 'package:vendor_list/screens/home/model/home_response.dart';
import 'package:vendor_list/screens/info/model/info_response.dart';
import 'package:vendor_list/screens/info/view/info.dart';
import 'package:vendor_list/screens/saved_companies/views/saved_companies_screen.dart';
import 'package:vendor_list/screens/search/model/vendors_search_response.dart';
import 'package:vendor_list/screens/search/view/search_screen.dart';

bool english = false;



/// Drawer
// class myDrawer extends StatelessWidget {
//   BuildContext context;
//   int layer;
//   Function changeLanguage;
//
//   myDrawer({this.context, this.layer, @required this.changeLanguage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       elevation: 2,
//       child: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(20),
//               color: Color(0xFF2EA5C3),
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       // shape: BoxShape.circle,
//
//                       image: DecorationImage(
//                         fit: BoxFit.fitHeight,
//                         image: AssetImage('assets/1/1.png'),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ///screens.home page condition
//             // (layer != 1)
//             //     ?
//             ListTile(
//                     leading: Icon(
//                       Icons.home_outlined,
//                     ),
//                     title: english
//                         ? Text(
//                             'Home',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xFF595959),
//                             ),
//                           )
//                         : Text(
//                             'الرئيسية',
//                             textDirection: TextDirection.rtl,
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xFF595959),
//                             ),
//                           ),
//                     onTap: () {
//                       for (int i = 0; i < layer; i++) Navigator.pop(context);
//                     },
//                   ),
//                 //: Opacity(opacity: 0),
//             ListTile(
//               leading: Icon(Icons.replay_outlined),
//               title: english
//                   ? Text(
//                       'Saved',
//                       style: TextStyle(
//                         color: Color(0xFF595959),
//                         fontSize: 18,
//                       ),
//                     )
//                   : Text(
//                       'الشركات المحفوظة',
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         color: Color(0xFF595959),
//                         fontSize: 18,
//                       ),
//                     ),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: ((context) => SavedCompaniesScreen(english
//                             ? "Saved Companies"
//                             : "الشركات المحفوظة"))));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.contact_support_outlined),
//               title: english
//                   ? Text(
//                       'Contact',
//                       style: TextStyle(
//                         color: Color(0xFF595959),
//                         fontSize: 18,
//                       ),
//                     )
//                   : Text(
//                       'التواصل',
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         color: Color(0xFF595959),
//                         fontSize: 18,
//                       ),
//                     ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: ((context) => ContactScreen())));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.info_outline),
//               title: english
//                   ? Text(
//                       'About',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xFF595959),
//                       ),
//                     )
//                   : Text(
//                       'حَول',
//                       textDirection: TextDirection.rtl,
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xFF595959),
//                       ),
//                     ),
//               onTap: () {
//                 Navigator.of(context).pushNamed('/strategies');
//               },
//             ),
//             layer == 1
//                 ? ListTile(
//                     leading: Icon(Icons.translate_outlined),
//                     title: english
//                         ? Text(
//                             'Language',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xFF595959),
//                             ),
//                           )
//                         : Text(
//                             'اللغة',
//                             textDirection: TextDirection.rtl,
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Color(0xFF595959),
//                             ),
//                           ),
//                     onTap: changeLanguage,
//
//                     // Navigator.of(context).pushNamed('/strategies');
//                   )
//                 : Opacity(
//                     opacity: 0,
//                   ),
//
//             // Spacer(),
//             // Row(
//             //   children: [
//             //     SocialMediaButton.facebook(
//             //       url: "https://twitter.com/CipliOnat",
//             //       // size: 35,
//             //       color: Colors.blue,
//             //     ),
//             //     SocialMediaButton.instagram(
//             //       url: "https://twitter.com/CipliOnat",
//             //       // size: 35,
//             //
//             //       color: Color(0xFF595959)
//             //     ),
//             //     SocialMediaButton.linkedin(
//             //       url: "https://twitter.com/CipliOnat",
//             //       // size: 35,
//             //       color: Colors.blue,
//             //     ),
//             //
//             //   ],
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }

/// Drawer

///AppBar
// class myAppBAr extends StatelessWidget {
//   bool screens.home;
//   String title;
//   BuildContext context;
//   bool Search = false;
//
//   myAppBAr({Key key, this.screens.home, this.title, this.context, this.Search}) {
//     if (Search == null) Search = false;
//   }
//
//   Widget _buildAppBarButton(
//       BuildContext context, String image, double width, bool back) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 2 / 32,
//       width: width,
//       color: back ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0),
//       child: Center(
//         child: Image(
//           height: back ? 22 : 45,
//           width: back ? 26 : 45,
//           fit: BoxFit.fitWidth,
//           image: AssetImage(image),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 3.5 / 32,
//       color: Color(0xFF2EA5C3),
//       child: english
//           ?
//           //english
//           Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width / 32,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Scaffold.of(context).openDrawer();
//                           },
//                           child: _buildAppBarButton(
//                               context,
//                               'assets/2/icon1.png',
//                               MediaQuery.of(context).size.width * 4 / 32,
//                               false),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.8 / 32,
//                         ),
//                         !Search
//                             ? GestureDetector(
//                                 onTap: () {
//                                   // showSearch(
//                                   //     context: context, delegate: DataSearch());
//
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: ((context) =>
//                                               SearchScreen())));
//                                 },
//                                 child: _buildAppBarButton(
//                                     context,
//                                     'assets/2/icon2.png',
//                                     MediaQuery.of(context).size.width * 4 / 32,
//                                     false),
//                               )
//                             : Container(),
//                       ],
//                     ),
//                   ],
//                 ),
//                 screens.home
//                     ?
//
//                     //title without button
//                     Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                             Row(children: [
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         5.5 /
//                                         32,
//                                   ),
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         1 /
//                                         32,
//                                   ),
//                                   Container(
//                                     width: MediaQuery.of(context).size.width *
//                                         16 /
//                                         32,
//                                     child: AutoSizeText(
//                                       title,
//                                       textScaleFactor: 1.8,
//                                       textDirection: TextDirection.rtl,
//                                       // minFontSize: 20,
//                                       maxLines: 1,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               // SizedBox(
//                               //   width: MediaQuery.of(context).size.width / 32,
//                               // ),
//                             ]),
//                           ])
//                     :
//                     //title without button
//
//                     Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                             Row(children: [
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width / 32,
//                               ),
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         1 /
//                                         32,
//                                   ),
//                                   Container(
//                                     width: MediaQuery.of(context).size.width *
//                                         11.5 /
//                                         32,
//                                     child: AutoSizeText(
//                                       title,
//                                       textScaleFactor: 1.5,
//
//                                       maxLines: 1,
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width:
//                                     MediaQuery.of(context).size.width * 4 / 32,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: _buildAppBarButton(
//                                   context,
//                                   english
//                                       ? 'assets/2/icon3.png'
//                                       : 'assets/3/2.png',
//                                   MediaQuery.of(context).size.width * 3.66 / 32,
//                                   true,
//                                 ),
//                               ),
//                             ]),
//                           ]),
//               ],
//             )
//           :
//           //arabic
//           Row(
//               children: [
//                 screens.home
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                             Row(children: [
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         1 /
//                                         32,
//                                   ),
//                                   Container(
//                                     width: MediaQuery.of(context).size.width *
//                                         16 /
//                                         32,
//                                     child: AutoSizeText(
//                                       title,
//                                       textDirection: TextDirection.rtl,
//                                       // minFontSize: 24,
//                                       textScaleFactor: 1.8,
//                                       maxLines: 1,
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width / 32,
//                               ),
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width *
//                                     5.5 /
//                                     32,
//                               ),
//                             ]),
//                           ])
//                     : Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                             Row(children: [
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width / 32,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: _buildAppBarButton(
//                                   context,
//                                   'assets/3/2.png',
//                                   MediaQuery.of(context).size.width * 3.66 / 32,
//                                   true,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width:
//                                     MediaQuery.of(context).size.width * 4 / 32,
//                               ),
//                               Column(
//                                 children: [
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height *
//                                         1 /
//                                         32,
//                                   ),
//                                   Container(
//                                     width: MediaQuery.of(context).size.width *
//                                         11.5 /
//                                         32,
//                                     child: AutoSizeText(
//                                       title,
//                                       textScaleFactor:1.5 ,
//                                       textDirection: TextDirection.rtl,
//                                       maxLines: 1,
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width:
//                                     MediaQuery.of(context).size.width * 2 / 32,
//                               ),
//                             ]),
//                           ]),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: ((context) => SearchScreen())));
//                           },
//                           child: _buildAppBarButton(
//                               context,
//                               'assets/2/icon2.png',
//                               MediaQuery.of(context).size.width * 4 / 32,
//                               false),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.8 / 32,
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Scaffold.of(context).openEndDrawer();
//                           },
//                           child: _buildAppBarButton(
//                               context,
//                               'assets/2/icon1.png',
//                               MediaQuery.of(context).size.width * 4 / 32,
//                               false),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//     );
//   }
// }


///AppBar

/// InfoBody
// class myInfoBody extends StatelessWidget {
//   InfoCompany company;
//   BuildContext context;
//   List<Advert> ads = [];
// String myimg;
//   myInfoBody({this.company, this.context, this.ads,this.myimg});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height / 32,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 4.5 / 32,
//             width: MediaQuery.of(context).size.height * 4.5 / 32,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 width: 1,
//                 color: Colors.black.withOpacity(0.2),
//               ),
//             ),
//             child: CachedNetworkImage(
//               imageUrl:
//               "http://vindorlist.sourcecode-ai.com/storage/${myimg}",
//               placeholder: (context, url) => Center(
//                 child: Lottie.asset('assets/loading_anim.json'),
//               ),
//               errorWidget: (context, url, error) => Center(
//                 child: Text(
//                   "Logo",
//                   style: TextStyle(
//                       color: Color(0xFF2EA5C3).withOpacity(0.6),
//                       fontSize: 22),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.25 / 32,
//           ),
//
//           // Container(
//           //   height: MediaQuery.of(context).size.height / 32,
//           //   child: AutoSizeText(
//           //     company.name,
//           //     textScaleFactor: 1,
//           //     // maxLines: 1,
//           //     style: TextStyle(
//           //       color: Color(0xFF2EA5C3).withOpacity(0.6),
//           //     ),
//           //   ),
//           // ),
//           AutoSizeText(
//             company.name,
//             textScaleFactor: 1.5,
//             // maxLines: 1,
//             style: TextStyle(
//               color: Color(0xFF2EA5C3).withOpacity(0.6),
//             ),
//           ),
//
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.1 / 32,
//           ),
//
//           iconLabel(
//               context: context,
//               image: 'assets/4/01.png',
//               label: company.vendor,
//               underLined: false,
//               index: -1,
//               color: false),
//           iconLabel(
//               context: context,
//               image: 'assets/4/02.png',
//               label: company.phone,
//               underLined: true,
//               index: 1,
//               color: false),
//           iconLabel(
//               context: context,
//               image: 'assets/4/07.png',
//               label: company.address.substring(0, company.address.indexOf(',')),
//               underLined: false,
//               index: -1,
//               color: false),
//           iconLabel(
//               context: context,
//               image: 'assets/4/04.png',
//               label:
//                   company.address.substring(company.address.indexOf(',') + 1),
//               underLined: false,
//               index: -1,
//               color: false),
//           iconLabel(
//               context: context,
//               image: 'assets/4/05.png',
//               label: company.website,
//               underLined: true,
//               index: 2,
//               color: false),
//           iconLabel(
//               context: context,
//               image: 'assets/4/06.png',
//               label: company.email,
//               underLined: true,
//               index: 3,
//               color: false),
//
//           GestureDetector(
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => Container(
//                   child: SfPdfViewer.network(
//                       'http://vindorlist.sourcecode-ai.com/storage/${company.profile}'),
//                 ),
//               );
//             },
//             child: Container(
//               width: MediaQuery.of(context).size.width * 2 / 3,
//               height: MediaQuery.of(context).size.height * 2.35 / 32,
//               decoration: BoxDecoration(
//                 color: Color(0xFF2EA5C3),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Center(
//                 child: english
//                     ? Text(
//                         "View Company Profile",
//                         style: TextStyle(color: Colors.white),
//                       )
//                     : Text(
//                         "عرض الصفحة الشخصية للشركة",
//                         textDirection: TextDirection.rtl,
//                         style: TextStyle(color: Colors.white),
//                       ),
//               ),
//             ),
//           ),
//           // SizedBox(height: MediaQuery.of(context).size.height * 0.25 / 32),
//
//           ///Ad
//           // Expanded(
//           //   flex: 1,
//           //   child: ads.length != 0
//           //       ? AutoSizeText(
//           //           english ? ads[0].titleEn : ads[0].titleAr,
//           //           textDirection:
//           //               english ? TextDirection.ltr : TextDirection.rtl,
//           //           textAlign: TextAlign.start,
//           //           //
//           //           style: TextStyle(
//           //               fontSize: english ? 10 : 5,
//           //               fontWeight: FontWeight.w100,
//           //               color: Colors.black.withOpacity(0.3)),
//           //         )
//           //       : Container(),
//           // ),
//           SizedBox(height: MediaQuery.of(context).size.height * 0.25 / 32),
//           Expanded(
//             flex: 6,
//             child: new Swiper(
//               autoplay: true,
//               itemBuilder: (BuildContext context, int index) {
//                 return Add(
//                     image: ads[index].image,
//                     height: MediaQuery.of(context).size.height / 4 -
//                         MediaQuery.of(context).size.height / 60,
//                     text: english ? ads[index].titleEn : ads[index].titleEn);
//               },
//               itemCount: ads.length,
//               pagination: new SwiperPagination(),
//               control: new SwiperControl(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget iconLabel(
//     {BuildContext context,
//     String label,
//     String image,
//     bool underLined,
//     int index,
//     bool color}) {
//   return english?Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width / 4,
//           ),
//
//           Container(
//             height: MediaQuery.of(context).size.height * 1.7 / 32,
//             width: MediaQuery.of(context).size.height * 1.7 / 32,
//             decoration: BoxDecoration(
//
//                 // color:color? Colors.white:Colors.transparent,
//                 // Color(0xFF2EA5C3),
//                 // borderRadius: BorderRadius.circular(50)
//                 ),
//             child: Container(
//               child: color
//                   ? Image(
//                       color: Color(0xFF2EA5C3),
//                       fit: BoxFit.fill,
//                       image: AssetImage(image),
//                     )
//                   : Image(
// // color: Color(0xFF2EA5C3),
//                       fit: BoxFit.fill,
//                       image: AssetImage(image),
//                     ),
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           underLined
//               ? GestureDetector(
//                   onTap: () async {
//                     String url = index == 2
//                         ? 'http://$label'
//                         : index == 1
//                             ? 'tel:$label'
//                             : 'mailto:$label'; //?subject= ad\&body=<body>
//                     if (await canLaunch(url)) {
//                       await launch(url);
//                     } else
//                       print("failed");
//                   },
//                   child: AutoSizeText(
//                     label,
//                     // stepGranularity: 5,
//                     overflow: TextOverflow.clip,
//                     textScaleFactor: 1,
//                     // minFontSize: 2,
//                     // maxLines: 1,
//                     style: TextStyle(
//                       decoration: underLined
//                           ? TextDecoration.underline
//                           : TextDecoration.none,
//                       color: Color(0xFF2EA5C3).withOpacity(0.6),
//                     ),
//                   ),
//                 )
//               : Flexible(
//                 child: AutoSizeText(
//                     label,
//                     textScaleFactor: 1,
//                     // maxLines: 1,
//                     // minFontSize: 2,
//                     // maxLines: 2,
//                     // stepGranularity: 5,
//                     // overflow: TextOverflow.ellipsis,
//                     // overflow: TextOverflow.fade,
//                     style: TextStyle(
//                       // decoration:
//                       // underLined ? TextDecoration.underline : TextDecoration.none,
//                       color: Color(0xFF2EA5C3).withOpacity(0.6),
//                     ),
//                   ),
//               ),
//         ],
//       ),
//       SizedBox(
//         height: MediaQuery.of(context).size.height * 0.45 / 32,
//       ),
//     ],
//   ):Column(
//     children: [
//
//
//       ///column
//       Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//         ///row
//
//
//           underLined
//               ? GestureDetector(
//             onTap: () async {
//               String url = index == 2
//                   ? 'http://$label'
//                   : index == 1
//                   ? 'tel:$label'
//                   : 'mailto:$label'; //?subject= ad\&body=<body>
//               if (await canLaunch(url)) {
//                 await launch(url);
//               } else
//                 print("failed");
//             },
//             child: AutoSizeText(
//               label,
//               textDirection: english?TextDirection.ltr:TextDirection.rtl,
//               // stepGranularity: 5,
//               overflow: TextOverflow.clip,
//               textScaleFactor: 1,
//               // minFontSize: 2,
//               // maxLines: 1,
//               style: TextStyle(
//                 decoration: underLined
//                     ? TextDecoration.underline
//                     : TextDecoration.none,
//                 color: Color(0xFF2EA5C3).withOpacity(0.6),
//               ),
//             ),
//           )
//               : Flexible(
//                 child: AutoSizeText(
//             label,
//             textScaleFactor: 1,
//                   textDirection: english?TextDirection.ltr:TextDirection.rtl,
//             // maxLines: 1,
//             minFontSize: 2,
//             maxLines: 2,
//             // stepGranularity: 5,
//             // overflow: TextOverflow.ellipsis,
//             // overflow: TextOverflow.fade,
//             style: TextStyle(
//                 // decoration:
//                 // underLined ? TextDecoration.underline : TextDecoration.none,
//                 color: Color(0xFF2EA5C3).withOpacity(0.6),
//             ),
//           ),
//               ),
//
//
//           SizedBox(
//             width: 15,
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 1.7 / 32,
//             width: MediaQuery.of(context).size.height * 1.7 / 32,
//             decoration: BoxDecoration(
//
//               // color:color? Colors.white:Colors.transparent,
//               // Color(0xFF2EA5C3),
//               // borderRadius: BorderRadius.circular(50)
//             ),
//             child: Container(
//               child: color
//                   ? Image(
//                 color: Color(0xFF2EA5C3),
//                 fit: BoxFit.fill,
//                 image: AssetImage(image),
//               )
//                   : Image(
// // color: Color(0xFF2EA5C3),
//                 fit: BoxFit.fill,
//                 image: AssetImage(image),
//               ),
//             ),
//           ),
//           Flexible(
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width / 4,
//             ),
//           ),
//
//           ///row
//         ],
//       ),
//       SizedBox(
//         height: MediaQuery.of(context).size.height * 0.45 / 32,
//       ),
//
//       ///column
//     ],
//   );
// }
/// InfoBody

///homeBody


///homeBody

///companyList
Widget Add({String image, double height, String text,bool comany_list}) {
  return Container(
    height: height,
    //margin: EdgeInsets.only(top: 2),
    child: CachedNetworkImage(
      /// fit: comany_list?BoxFit.cover:BoxFit.fill,
      fit: comany_list?BoxFit.fill:BoxFit.fill,
      imageUrl: "http://vindorlist.sourcecode-ai.com/storage/$image",
      // placeholder: (context, url) => Center(child: Lottie.asset('assets/anm1.json'),),
      errorWidget: (context, url, error) => Center(
        child: Text(
          "Logo",
          style: TextStyle(
              color: Color(0xFF2EA5C3).withOpacity(0.6), fontSize: 22),
        ),
      ),
    ),
  );
}

// class mycompanyListBody extends StatelessWidget {
//   List<Advert> ads;
//   String section;
//   BuildContext context;
//   List<Company> companies = [];
//
//   mycompanyListBody({this.context, this.section, this.companies, this.ads});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(children: [
//         ///Ad
//         ads.length != 0
//             ? Column(
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.height / 4,
//                     child: Swiper(
//                       autoplay: true,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Add(
//                             image: ads[index].image,
//                             height: MediaQuery.of(context).size.height / 4 -
//                                 MediaQuery.of(context).size.height / 60,
//                             text: english
//                                 ? ads[index].titleEn
//                                 : ads[index].titleEn);
//                       },
//                       itemCount: ads.length,
//                       pagination: new SwiperPagination(),
//                       control: new SwiperControl(),
//                     ),
//                   ),
//                 ],
//               )
//             : Container(),
//         SizedBox(
//           height: 2,
//         ),
//         ads.length != 0
//             ?
//         Container()
//         ///add text
//         // Text(
//         //         english ? ads[0].titleEn : ads[0].titleAr,
//         //         style: TextStyle(
//         //             fontSize: 10,
//         //             fontWeight: FontWeight.w100,
//         //             color: Colors.black.withOpacity(0.3)),
//         //       )
//             : Container(),
//
//         Expanded(
//             child: ListView.builder(
//           itemCount: companies.length,
//           itemBuilder: (context, index) => cardButton(
//               context: context,
//               company: companies[index],
//               section: section,
//               s: true),
//         )),
//       ]),
//     );
//   }
// }


///companyList

///mySavedCompanyListBody
// class mySavedCompanyListBody extends StatelessWidget {
//   Widget Add({String image, double height}) {
//     return Container(
//       height: height,
//       margin: EdgeInsets.only(top: 2),
//       decoration: BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage(image),
//         fit: BoxFit.fill,
//       )),
//     );
//   }
//
//   String section;
//   BuildContext context;
//   mySavedCompanyListBody({this.context, this.section});
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(children: [
//         ///Ad
//         Container(
//           height: 180,
//           child: Swiper(
//             onIndexChanged: (int) {},
//             autoplay: true,
//             itemBuilder: (BuildContext context, int index) {
//               return Add(image: 'assets/3/1.png', height: 180);
//             },
//             itemCount: 3,
//             pagination: new SwiperPagination(),
//             control: new SwiperControl(),
//           ),
//         ),
//
//         SizedBox(
//           height: 2,
//         ),
//         Text(
//           "Advertisement",
//           style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
//         ),
//
//         Expanded(
//               child: ListView.builder(
//                 itemCount: SavedCompanies.saved.length,
//                 itemBuilder: (context, index) => Container(),
//
//                     // cardButton(
//                     // context: context,
//                     // // company: SavedCompanies.saved[index],
//                     // section: section,
//                     // s: false),
//
//
//
//               ),
//             ) ??
//             SavedCompanies.saved.length != 0,
//       ]),
//     );
//   }
// }

///mySavedCompanyListBody
