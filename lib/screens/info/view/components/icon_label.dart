import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendor_list/widgets/widgets.dart';


class iconLabel extends StatelessWidget {
  String label;
  String image;
  bool underLined;
  int index;
  bool color;
  bool language;

  iconLabel({BuildContext context,
    this.label,
    this.image,
    this.underLined,
    this.index,
    this.color,
    this.language});

  @override
  Widget build(BuildContext context) {
    // label+="blablablablablabalbalbalbalbalablablablablablablablablablablabalbalbalbalbalbalbalablablablablablblablablablablablablablablabla";


   return Directionality(textDirection: language?TextDirection.ltr:TextDirection.rtl, child: SizedBox(
     // height: MediaQuery.of(context).size.height * 1.7 / 32,
     // width: 200,
     child: Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             SizedBox(
               width: MediaQuery
                   .of(context)
                   .size
                   .width*8 / 32,
             ),

             Container(
               height: MediaQuery
                   .of(context)
                   .size
                   .width *3 / 32,
               width: MediaQuery
                   .of(context)
                   .size
                   .width *3 / 32,
               decoration: BoxDecoration(

                 // color:color? Colors.white:Colors.transparent,
                 // Color(0xFF2EA5C3),
                 // borderRadius: BorderRadius.circular(50)
               ),
               child: Container(
                 child: color
                     ? Image(
                   color: Color(0xFF2EA5C3),
                   fit: BoxFit.fill,
                   image: AssetImage(image),
                 )
                     : Image(
// color: Color(0xFF2EA5C3),
                   fit: BoxFit.fill,
                   image: AssetImage(image),
                 ),
               ),
             ),
             SizedBox(
               width: MediaQuery
                   .of(context)
                   .size
                   .width *1 / 32,
             ),
             underLined
                 ? Container(
               width: MediaQuery
                   .of(context)
                   .size
                   .width *18 / 32,
               child: GestureDetector(
                 onTap: () async {
                   String url = index == 2
                       ? 'http://$label'
                       : index == 1
                       ? 'tel:$label'
                       : 'mailto:$label'; //?subject= ad\&body=<body>
                   if (await canLaunch(url)) {
                     await launch(url);
                   } else {
                     AwesomeDialog(context: context,
                       dialogType: DialogType.WARNING,
                       body: Text(

                           english
                               ? "Sorry no Url exist"
                               : "عذراً لا يوجد رابط",
                           style: TextStyle(
                               fontWeight: FontWeight.w300, fontSize: 14)
                       ),)
                       ..show();
                     print("failed");
                   }
                 },
                 child: Container(
                   width: MediaQuery
                       .of(context)
                       .size
                       .width *18 / 32,
                   child: color ? AutoSizeText(

                     label,
                     softWrap: true,
                     // stepGranularity: 5,
                     overflow: TextOverflow.clip,
                     textScaleFactor: 1,
                     minFontSize: 10,
                     maxLines: 3,
                     style: TextStyle(
                       decoration: underLined
                           ? TextDecoration.underline
                           : TextDecoration.none,
                       color: Color(0xFF2EA5C3).withOpacity(0.6),
                     ),
                   )
                       :
                   //    ReadMoreText(
                   //      //'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                   // label,
                   //      style: TextStyle(color: Colors.black),
                   //      trimLines: 3,
                   //      colorClickableText: Colors.blue.withOpacity(0.5),
                   //      trimMode: TrimMode.Length,
                   //      trimLength: 20,
                   //      trimCollapsedText: english?'Show more':'عرض اكثر',
                   //      trimExpandedText: english?'Show less':'عرض اقل',
                   //      moreStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
                   //      delimiterStyle: TextStyle(color: Colors.blue),
                   //
                   //    ),
                   AutoSizeText(
                     label,
                     softWrap: true,
                     // softWrap: true,
                     // stepGranularity: 5,
                     overflow: TextOverflow.clip,
                     textScaleFactor: 1,
                     minFontSize: 10,
                     // minFontSize: 2,
                     maxLines: 3,
                     style: TextStyle(
                       decoration: underLined
                           ? TextDecoration.underline
                           : TextDecoration.none,
                       color: Color(0xFF2EA5C3).withOpacity(0.6),
                     ),
                   ),
                 ),

               ),
             )
                 : color ? Container(
               width: MediaQuery
                   .of(context)
                   .size
                   .width *18 / 32,
               child:
               AutoSizeText(
                 label,
                 softWrap: true,
                 textScaleFactor: 1,
                 maxLines: 3,
                 minFontSize: 10,
                 // minFontSize: 2,
                 // maxLines: 2,
                 // stepGranularity: 5,
                 // overflow: TextOverflow.ellipsis,
                 // overflow: TextOverflow.fade,
                 style: TextStyle(
                   // decoration:
                   // underLined ? TextDecoration.underline : TextDecoration.none,
                   color: Color(0xFF2EA5C3).withOpacity(0.6),
                 ),
               ),
             ) :

             Container(
               width: MediaQuery
                   .of(context)
                   .size
                   .width *18 / 32,
               child: AutoSizeText(
                 label,
                 softWrap: true,
                 textScaleFactor: 0.9,
                 maxLines: 3,
                 minFontSize: 10,
                 // minFontSize: 2,
                 // maxLines: 2,
                 // stepGranularity: 5,
                 // overflow: TextOverflow.ellipsis,
                 // overflow: TextOverflow.fade,
                 style: TextStyle(
                   // decoration:
                   // underLined ? TextDecoration.underline : TextDecoration.none,
                   color: Color(0xFF2EA5C3).withOpacity(0.6),
                 ),
               ),
             ),
           ],
         ),
         SizedBox(
           height: MediaQuery
               .of(context)
               .size
               .height * 0.45 / 32,
         ),
       ],
     ),
   ));







//     return language ?
//     SizedBox(
//       // height: MediaQuery.of(context).size.height * 1.7 / 32,
//       // width: 200,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width*8 / 32,
//               ),
//
//               Container(
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .width *3 / 32,
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width *3 / 32,
//                 decoration: BoxDecoration(
//
//                   // color:color? Colors.white:Colors.transparent,
//                   // Color(0xFF2EA5C3),
//                   // borderRadius: BorderRadius.circular(50)
//                 ),
//                 child: Container(
//                   child: color
//                       ? Image(
//                     color: Color(0xFF2EA5C3),
//                     fit: BoxFit.fill,
//                     image: AssetImage(image),
//                   )
//                       : Image(
// // color: Color(0xFF2EA5C3),
//                     fit: BoxFit.fill,
//                     image: AssetImage(image),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width *1 / 32,
//               ),
//               underLined
//                   ? Container(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width *18 / 32,
//                 child: GestureDetector(
//                   onTap: () async {
//                     String url = index == 2
//                         ? 'http://$label'
//                         : index == 1
//                         ? 'tel:$label'
//                         : 'mailto:$label'; //?subject= ad\&body=<body>
//                     if (await canLaunch(url)) {
//                       await launch(url);
//                     } else {
//                       AwesomeDialog(context: context,
//                         dialogType: DialogType.WARNING,
//                         body: Text(
//
//                             english
//                                 ? "Sorry no Url exist"
//                                 : "عذراً لا يوجد رابط",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w300, fontSize: 14)
//                         ),)
//                         ..show();
//                       print("failed");
//                     }
//                   },
//                   child: Container(
//                     width: MediaQuery
//                         .of(context)
//                         .size
//                         .width *18 / 32,
//                     child: color ? AutoSizeText(
//
//                       label,
//                       softWrap: true,
//                       // stepGranularity: 5,
//                       overflow: TextOverflow.clip,
//                       textScaleFactor: 1,
//                       // minFontSize: 2,
//                       maxLines: 3,
//                       style: TextStyle(
//                         decoration: underLined
//                             ? TextDecoration.underline
//                             : TextDecoration.none,
//                         color: Color(0xFF2EA5C3).withOpacity(0.6),
//                       ),
//                     )
//                         :
//                  //    ReadMoreText(
//                  //      //'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
//                  // label,
//                  //      style: TextStyle(color: Colors.black),
//                  //      trimLines: 3,
//                  //      colorClickableText: Colors.blue.withOpacity(0.5),
//                  //      trimMode: TrimMode.Length,
//                  //      trimLength: 20,
//                  //      trimCollapsedText: english?'Show more':'عرض اكثر',
//                  //      trimExpandedText: english?'Show less':'عرض اقل',
//                  //      moreStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
//                  //      delimiterStyle: TextStyle(color: Colors.blue),
//                  //
//                  //    ),
//                     AutoSizeText(
//                       label,
//                       softWrap: true,
//                       // softWrap: true,
//                       // stepGranularity: 5,
//                       overflow: TextOverflow.clip,
//                       textScaleFactor: 1,
//                       // minFontSize: 2,
//                       maxLines: 3,
//                       style: TextStyle(
//                         decoration: underLined
//                             ? TextDecoration.underline
//                             : TextDecoration.none,
//                         color: Color(0xFF2EA5C3).withOpacity(0.6),
//                       ),
//                     ),
//                   ),
//
//                 ),
//               )
//                   : color ? Container(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width *18 / 32,
//                 child:
//                 AutoSizeText(
//                   label,
//                   softWrap: true,
//                   textScaleFactor: 1,
//                   maxLines: 3,
//                   // minFontSize: 2,
//                   // maxLines: 2,
//                   // stepGranularity: 5,
//                   // overflow: TextOverflow.ellipsis,
//                   // overflow: TextOverflow.fade,
//                   style: TextStyle(
//                     // decoration:
//                     // underLined ? TextDecoration.underline : TextDecoration.none,
//                     color: Color(0xFF2EA5C3).withOpacity(0.6),
//                   ),
//                 ),
//               ) :
//
//               Container(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width *18 / 32,
//                 child: AutoSizeText(
//                   label,
//                   softWrap: true,
//                   textScaleFactor: 0.9,
//                   maxLines: 3,
//                   // minFontSize: 2,
//                   // maxLines: 2,
//                   // stepGranularity: 5,
//                   // overflow: TextOverflow.ellipsis,
//                   // overflow: TextOverflow.fade,
//                   style: TextStyle(
//                     // decoration:
//                     // underLined ? TextDecoration.underline : TextDecoration.none,
//                     color: Color(0xFF2EA5C3).withOpacity(0.6),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery
//                 .of(context)
//                 .size
//                 .height * 0.45 / 32,
//           ),
//         ],
//       ),
//     )
//         :
//     SizedBox(
//
//       // width: 200,
//       child: Column(
//         children: [
//
//
//           ///column
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//
//               ///row
//
//
//               underLined
//                   ? GestureDetector(
//                 onTap: () async {
//                   String url = index == 2
//                       ? 'http://$label'
//                       : index == 1
//                       ? 'tel:$label'
//                       : 'mailto:$label'; //?subject= ad\&body=<body>
//                   if (await canLaunch(url)) {
//                     await launch(url);
//                   } else {
//                     AwesomeDialog(context: context,
//                       dialogType: DialogType.WARNING,
//                       body: Text(
//
//                           english ? "Sorry no Url exist" : "عذراً لا يوجد رابط",
//                           style: TextStyle(fontWeight: FontWeight.w300,
//                               fontSize: 14)
//                       ),)
//                       ..show();
//                     print("failed");
//                   }
//                 },
//                 child: color ? Container(
//                   width: MediaQuery
//                       .of(context)
//                       .size
//                       .width * 2.8 / 4,
//                   child: color ? AutoSizeText(
//                     label,
//                     softWrap: true,
//                     textDirection: language ? TextDirection.ltr : TextDirection
//                         .rtl,
//                     // stepGranularity: 5,
//                     overflow: TextOverflow.clip,
//                     textScaleFactor: 1,
//                     // minFontSize: 2,
//                     maxLines: 4,
//                     style: TextStyle(
//                       decoration: underLined
//                           ? TextDecoration.underline
//                           : TextDecoration.none,
//                       color: Color(0xFF2EA5C3).withOpacity(0.6),
//                     ),
//                   ) : AutoSizeText(
//                     label,
//                     // softWrap: true,
//                     textDirection: language ? TextDirection.ltr : TextDirection
//                         .rtl,
//                     // stepGranularity: 5,
//                     overflow: TextOverflow.clip,
//                     textScaleFactor: 1,
//                     // minFontSize: 2,
//                     maxLines: 4,
//                     style: TextStyle(
//                       decoration: underLined
//                           ? TextDecoration.underline
//                           : TextDecoration.none,
//                       color: Color(0xFF2EA5C3).withOpacity(0.6),
//                     ),
//                   ),
//                 ) : Container(
//                   // width: MediaQuery.of(context).size.width*3/4,
//                   child: color ? AutoSizeText(
//                     label,
//                     softWrap: true,
//                     textDirection: language ? TextDirection.ltr : TextDirection
//                         .rtl,
//                     // stepGranularity: 5,
//                     overflow: TextOverflow.clip,
//                     textScaleFactor: 1,
//                     // minFontSize: 2,
//                     maxLines: 4,
//                     style: TextStyle(
//                       decoration: underLined
//                           ? TextDecoration.underline
//                           : TextDecoration.none,
//                       color: Color(0xFF2EA5C3).withOpacity(0.6),
//                     ),
//                   ) : AutoSizeText(
//                     label,
//                     // softWrap: true,
//                     textDirection: language ? TextDirection.ltr : TextDirection
//                         .rtl,
//                     // stepGranularity: 5,
//                     overflow: TextOverflow.clip,
//                     textScaleFactor: 1,
//                     // minFontSize: 2,
//                     maxLines: 4,
//                     style: TextStyle(
//                       decoration: underLined
//                           ? TextDecoration.underline
//                           : TextDecoration.none,
//                       color: Color(0xFF2EA5C3).withOpacity(0.6),
//                     ),
//                   ),
//                 ),
//               )
//                   : color ? AutoSizeText(
//                 label,
//                 textScaleFactor: 1,
//                 softWrap: true,
//                 textDirection: language ? TextDirection.ltr : TextDirection.rtl,
//                 // maxLines: 1,
//                 minFontSize: 2,
//                 maxLines: 4,
//                 // stepGranularity: 5,
//                 // overflow: TextOverflow.ellipsis,
//                 // overflow: TextOverflow.fade,
//                 style: TextStyle(
//                   // decoration:
//                   // underLined ? TextDecoration.underline : TextDecoration.none,
//                   color: Color(0xFF2EA5C3).withOpacity(0.6),
//                 ),
//               ) : AutoSizeText(
//                 label,
//                 textScaleFactor: 1,
//                 // softWrap: true,
//                 textDirection: language ? TextDirection.ltr : TextDirection.rtl,
//                 // maxLines: 1,
//                 minFontSize: 2,
//                 maxLines: 4,
//                 // stepGranularity: 5,
//                 // overflow: TextOverflow.ellipsis,
//                 // overflow: TextOverflow.fade,
//                 style: TextStyle(
//                   // decoration:
//                   // underLined ? TextDecoration.underline : TextDecoration.none,
//                   color: Color(0xFF2EA5C3).withOpacity(0.6),
//                 ),
//               ),
//
//
//               SizedBox(
//                 width: 15,
//               ),
//               Container(
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .height * 1.7 / 32,
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .height * 1.7 / 32,
//                 decoration: BoxDecoration(
//
//                   // color:color? Colors.white:Colors.transparent,
//                   // Color(0xFF2EA5C3),
//                   // borderRadius: BorderRadius.circular(50)
//                 ),
//                 child: Container(
//                   child: color
//                       ? Image(
//                     color: Color(0xFF2EA5C3),
//                     fit: BoxFit.fill,
//                     image: AssetImage(image),
//                   )
//                       : Image(
// // color: Color(0xFF2EA5C3),
//                     fit: BoxFit.fill,
//                     image: AssetImage(image),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width / 4,
//               ),
//
//               ///row
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery
//                 .of(context)
//                 .size
//                 .height * 0.45 / 32,
//           ),
//
//           ///column
//         ],
//       ),
//     );
  }
}
