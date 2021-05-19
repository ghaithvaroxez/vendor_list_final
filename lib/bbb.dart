// import 'package:flutter/material.dart';
//
// class fdfd extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//       // height: MediaQuery.of(context).size.height * 1.7 / 32,
//       // width: 200,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               ///hgfhgfhgf
//
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
//                     //    ReadMoreText(
//                     //      //'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
//                     // label,
//                     //      style: TextStyle(color: Colors.black),
//                     //      trimLines: 3,
//                     //      colorClickableText: Colors.blue.withOpacity(0.5),
//                     //      trimMode: TrimMode.Length,
//                     //      trimLength: 20,
//                     //      trimCollapsedText: english?'Show more':'عرض اكثر',
//                     //      trimExpandedText: english?'Show less':'عرض اقل',
//                     //      moreStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
//                     //      delimiterStyle: TextStyle(color: Colors.blue),
//                     //
//                     //    ),
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
//
//               SizedBox(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width*8 / 32,
//               ),
//
//               ///hgfhgfhgf
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
//     );
//   }
// }
