import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/sharedpref_helper.dart';
import 'package:vendor_list/screens/company_list/model/company_list_response.dart';
import 'package:vendor_list/screens/info/view/info.dart';

///Card Button
class cardButton extends StatefulWidget {
  BuildContext context;
  String section;
  Company company;
  bool s;
  bool language;
  cardButton({this.context, this.section, this.company, this.s,this.language});

  @override
  _cardButtonState createState() => _cardButtonState();
}

class _cardButtonState extends State<cardButton> {
  @override
  Widget build(BuildContext context) {


    return Directionality(textDirection: widget.language?TextDirection.ltr:TextDirection.rtl, child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Info(
                  section: widget.section,
                  comId: widget.company.id,
                  myimg: widget.company.logo,
                )));
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        // height: 110,
        margin: EdgeInsets.all(3),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(width: 0.01)),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width *2/ 32,
            ),

            Container(
              height:  MediaQuery.of(context).size.height *3.9/ 32,
              // height:MediaQuery.of(context).size.width *7/ 32,
              width:  MediaQuery.of(context).size.width *7/ 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              child: CachedNetworkImage(
                imageUrl:
                "http://vindorlist.sourcecode-ai.com/storage/${widget.company.logo}",
                placeholder: (context, url) => Center(
                  child: Lottie.asset('assets/loading_anim.json'),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Text(
                    "Logo",
                    style: TextStyle(
                        color: Color(0xFF2EA5C3).withOpacity(0.6),
                        fontSize: 22),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width *3/ 36,
            ),

            Container(
              width: MediaQuery.of(context).size.width *13/ 32,
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      // widget.company.name+" البلا بلا بلا بلا",
                      widget.company.name,
                    minFontSize: 10,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      widget.company.address,
                      maxLines: 1,
                      minFontSize: 12,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      widget.company.phone,
                      minFontSize: 10,
                      // maxLines: 1,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(width: MediaQuery.of(context).size.width/12,),
            // SizedBox(width: MediaQuery.of(context).size.width/12,),

            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.company.saved) {
                            widget.company.saved = false;
                            SharedPreferenceHelper.unSaveCompany(
                                widget.company.id.toString());
                            //  SavedCompanies.unSaveCompany(widget.company);
                          } else {
                            widget.company.saved = true;
                            SharedPreferenceHelper.saveCompany(
                                widget.company.id.toString());
                            // SavedCompanies.saveCompany(widget.company);
                          }
                          print("hello");
                        });
                      },
                      child: widget.s
                          ? Opacity(
                        opacity: widget.company.saved ? 1 : 0.3,
                        child: Container(
                            color: Colors.transparent,
                            height:MediaQuery.of(context).size.height / 11,
                            width: MediaQuery.of(context).size.width *5/ 32,
                            child: Image(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/3/4.png'))),
                      )
                          : Opacity(
                        opacity: 0,
                      ),
                    ),
                    // Container(color: Colors.transparent,height:60,width:60,child: Image(fit: BoxFit.fill,image: AssetImage('assets/3/4.png')))??widget.saved,
                    SizedBox(
                      width: MediaQuery.of(context).size.width *1/ 32,
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    ));








    // bool img = true;
    // if (widget.company.logo == null) widget.company.logo = "";
    // if (widget.company.logo == "") img = false;
    // return widget.language?GestureDetector(
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => Info(
    //               section: widget.section,
    //               comId: widget.company.id,
    //               myimg: widget.company.logo,
    //             )));
    //   },
    //   child: Container(
    //     height: MediaQuery.of(context).size.height / 8,
    //     // height: 110,
    //     margin: EdgeInsets.all(3),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(2),
    //         border: Border.all(width: 0.01)),
    //     child: Row(
    //       children: [
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width *2/ 32,
    //         ),
    //
    //         Container(
    //           height:  MediaQuery.of(context).size.height *3.9/ 32,
    //           // height:MediaQuery.of(context).size.width *7/ 32,
    //           width:  MediaQuery.of(context).size.width *7/ 32,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             border: Border.all(
    //               width: 1,
    //               color: Colors.black.withOpacity(0.2),
    //             ),
    //           ),
    //           child: CachedNetworkImage(
    //             imageUrl:
    //             "http://vindorlist.sourcecode-ai.com/storage/${widget.company.logo}",
    //             placeholder: (context, url) => Center(
    //               child: Lottie.asset('assets/loading_anim.json'),
    //             ),
    //             errorWidget: (context, url, error) => Center(
    //               child: Text(
    //                 "Logo",
    //                 style: TextStyle(
    //                     color: Color(0xFF2EA5C3).withOpacity(0.6),
    //                     fontSize: 22),
    //               ),
    //             ),
    //           ),
    //         ),
    //
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width *3/ 36,
    //         ),
    //
    //         Container(
    //     width: MediaQuery.of(context).size.width *13/ 32,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Container(
    //                 width: MediaQuery.of(context).size.width *7/ 32,
    //                 child: AutoSizeText(
    //                   widget.company.name,
    //                   maxLines: 1,
    //                   style: TextStyle(fontWeight: FontWeight.w400),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //               AutoSizeText(
    //                 widget.company.address,
    //                 maxLines: 1,
    //                 style: TextStyle(fontWeight: FontWeight.w400),
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //               AutoSizeText(
    //                 widget.company.phone,
    //                 maxLines: 1,
    //                 style: TextStyle(fontWeight: FontWeight.w400),
    //               ),
    //             ],
    //           ),
    //         ),
    //         // SizedBox(width: MediaQuery.of(context).size.width/12,),
    //         // SizedBox(width: MediaQuery.of(context).size.width/12,),
    //
    //         Column(
    //           children: [
    //             Row(
    //               children: [
    //                 GestureDetector(
    //                   onTap: () {
    //                     setState(() {
    //                       if (widget.company.saved) {
    //                         widget.company.saved = false;
    //                         SharedPreferenceHelper.unSaveCompany(
    //                             widget.company.id.toString());
    //                         //  SavedCompanies.unSaveCompany(widget.company);
    //                       } else {
    //                         widget.company.saved = true;
    //                         SharedPreferenceHelper.saveCompany(
    //                             widget.company.id.toString());
    //                         // SavedCompanies.saveCompany(widget.company);
    //                       }
    //                       print("hello");
    //                     });
    //                   },
    //                   child: widget.s
    //                       ? Opacity(
    //                     opacity: widget.company.saved ? 1 : 0.3,
    //                     child: Container(
    //                         color: Colors.transparent,
    //                         height:MediaQuery.of(context).size.height / 11,
    //                         width: MediaQuery.of(context).size.width *5/ 32,
    //                         child: Image(
    //                             fit: BoxFit.fill,
    //                             image: AssetImage('assets/3/4.png'))),
    //                   )
    //                       : Opacity(
    //                     opacity: 0,
    //                   ),
    //                 ),
    //                 // Container(color: Colors.transparent,height:60,width:60,child: Image(fit: BoxFit.fill,image: AssetImage('assets/3/4.png')))??widget.saved,
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width *1/ 32,
    //                 ),
    //               ],
    //             ),
    //             Spacer(),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // ):
    // GestureDetector(
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => Info(
    //               section: widget.section,
    //               comId: widget.company.id,
    //               myimg:widget.company.logo ,
    //             )));
    //   },
    //   child: Container(
    //     height: MediaQuery.of(context).size.height / 8,
    //     // height: 110,
    //     margin: EdgeInsets.all(3),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(2),
    //         border: Border.all(width: 0.01)),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width / 16,
    //         ),
    //         ///main row
    //         Column(
    //           ///saved sign
    //           children: [
    //             Row(
    //               children: [
    //                 GestureDetector(
    //                   onTap: () {
    //                     setState(() {
    //                       if (widget.company.saved) {
    //                         widget.company.saved = false;
    //                         SharedPreferenceHelper.unSaveCompany(
    //                             widget.company.id.toString());
    //                         //  SavedCompanies.unSaveCompany(widget.company);
    //                       } else {
    //                         widget.company.saved = true;
    //                         SharedPreferenceHelper.saveCompany(
    //                             widget.company.id.toString());
    //                         // SavedCompanies.saveCompany(widget.company);
    //                       }
    //                       print("hello");
    //                     });
    //                   },
    //                   child: widget.s
    //                       ? Opacity(
    //                     opacity: widget.company.saved ? 1 : 0.3,
    //                     child: Container(
    //                         color: Colors.transparent,
    //                         height: 60,
    //                         width: 60,
    //                         child: Image(
    //                             fit: BoxFit.fill,
    //                             image: AssetImage('assets/3/4.png'))),
    //                   )
    //                       : Opacity(
    //                     opacity: 0,
    //                   ),
    //                 ),
    //                 // Container(color: Colors.transparent,height:60,width:60,child: Image(fit: BoxFit.fill,image: AssetImage('assets/3/4.png')))??widget.saved,
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //               ],
    //             ),
    //             Spacer(),
    //           ],
    //         ),
    //         Expanded(
    //           flex: 3,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               AutoSizeText(
    //
    //                 widget.company.name,
    //                 textDirection: TextDirection.rtl,
    //                 maxLines: 1,
    //                 style: TextStyle(fontWeight: FontWeight.w400),
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //               AutoSizeText(
    //                 widget.company.address,
    //                 textDirection: TextDirection.rtl,
    //                 maxLines: 1,
    //                 style: TextStyle(fontWeight: FontWeight.w400),
    //               ),
    //               SizedBox(
    //                 height: 5,
    //               ),
    //               AutoSizeText(
    //                 widget.company.phone,
    //                 textDirection: TextDirection.rtl,
    //                 maxLines: 1,
    //                 style: TextStyle(fontWeight: FontWeight.w400),
    //               ),
    //             ],
    //           ),
    //         ),
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width / 12,
    //         ),
    //         Container(
    //           height: 75,
    //           width: 75,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             border: Border.all(
    //               width: 1,
    //               color: Colors.black.withOpacity(0.2),
    //             ),
    //           ),
    //           child: CachedNetworkImage(
    //             imageUrl:
    //             "http://vindorlist.sourcecode-ai.com/storage/${widget.company.logo}",
    //             placeholder: (context, url) => Center(
    //               child: Lottie.asset('assets/loading_anim.json'),
    //             ),
    //             errorWidget: (context, url, error) => Center(
    //               child: Text(
    //                 "Logo",
    //                 style: TextStyle(
    //                     color: Color(0xFF2EA5C3).withOpacity(0.6),
    //                     fontSize: 22),
    //               ),
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           width: MediaQuery.of(context).size.width / 16,
    //         ),
    //
    //
    //
    //
    //         // SizedBox(width: MediaQuery.of(context).size.width/12,),
    //         // SizedBox(width: MediaQuery.of(context).size.width/12,),
    //
    //
    //         ///mainrow
    //       ],
    //     ),
    //   ),
    // );
  }
}
///Card Button