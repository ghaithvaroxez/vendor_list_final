import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vendor_list/screens/home/model/home_response.dart';
import 'package:vendor_list/screens/info/model/info_response.dart';
import 'package:vendor_list/widgets/widgets.dart';

import 'icon_label.dart';

class myInfoBody extends StatelessWidget {
  InfoCompany company;
  BuildContext context;
  List<Advert> ads = [];
  String myimg;
  bool language;
  myInfoBody({this.company, this.context, this.ads,this.myimg,this.language});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 32,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 4.5 / 32,
            width: MediaQuery.of(context).size.height * 4.5 / 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl:
              "http://vindorlist.sourcecode-ai.com/storage/${myimg}",
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
            height: MediaQuery.of(context).size.height * 0.25 / 32,
          ),

          // Container(
          //   height: MediaQuery.of(context).size.height / 32,
          //   child: AutoSizeText(
          //     company.name,
          //     textScaleFactor: 1,
          //     // maxLines: 1,
          //     style: TextStyle(
          //       color: Color(0xFF2EA5C3).withOpacity(0.6),
          //     ),
          //   ),
          // ),
          // Container(
          //   width: 200,
          //   height: 100,
          //   child: ReadMoreText(
          //     'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
          //     trimLines: 2,
          //     colorClickableText: Colors.pink,
          //     trimMode: TrimMode.Line,
          //     trimCollapsedText: 'Show more',
          //     trimExpandedText: 'Show less',
          //     moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          //   ),
          // ),
          ReadMoreText(
            //'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            company.name,
            style: TextStyle(color: Colors.black),
            trimLines: 3,
            colorClickableText: Colors.blue.withOpacity(0.5),
            trimMode: TrimMode.Length,
            trimLength: 50,
            trimCollapsedText: english?'Show more':'عرض اكثر',
            trimExpandedText: english?'Show less':'عرض اقل',
            moreStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
            delimiterStyle: TextStyle(color: Colors.blue),
          ),
          // AutoSizeText(
          //   company.name,
          //   textScaleFactor: 1.5,
          //   // maxLines: 1,
          //   style: TextStyle(
          //     color: Color(0xFF2EA5C3).withOpacity(0.6),
          //   ),
          // ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1 / 32,
          ),
          Spacer(),
          company.responser==""?Container():iconLabel(
              context: context,
              image: 'assets/4/01.png',
              label: company.responser??"",
              underLined: false,
              index: -1,
              color: false,language: language),
          company.phone==""?Container():iconLabel(
              context: context,
              image: 'assets/4/02.png',
              label: company.phone??"",
              underLined: true,
              index: 1,
              color: false,language: language),
          company.address==""?Container():company.address.contains(',')?
          // company.address.indexOf(',')+1<company.address.length?
          Column(children: [
            iconLabel(
                context: context,
                image: 'assets/4/07.png',
                label: company.address.substring(0, company.address.indexOf(',')),
                // ==""??"",
                underLined: false,
                index: -1,
                color: false,language: language),
            company.address.indexOf(',')+1<company.address.length?iconLabel(
                context: context,
                image: 'assets/4/04.png',
                label:
                company.address.substring(company.address.indexOf(',') + 1),
                // ??"",
                underLined: false,
                index: -1,
                color: false,language: language):Container(),
          ],
          )
              :         Container(
            child: iconLabel(
                context: context,
                image: 'assets/4/07.png',
                label: company.address,
                // ==null??"",
                underLined: false,
                index: -1,
                color: false,language: language),
          ),
          company.website==""?Container():iconLabel(
              context: context,
              image: 'assets/4/05.png',
              label: company.website??"",
              underLined: true,
              index: 2,
              color: false,language: language),
          company.email==""?Container():iconLabel(
              context: context,
              image: 'assets/4/06.png',
              label: company.email??"",
              underLined: true,
              index: 3,
              color: false,language: language),
          Spacer(),
          company.profile==""?Container(): GestureDetector(
            // onTap: () {
            //   showDialog(
            //     context: context,
            //     builder: (context) => Container(
            //       child: SfPdfViewer.network(
            //           'http://vindorlist.sourcecode-ai.com/storage/${company.profile}'),
            //     ),
            //   );
            // },
            onTap: () async {
              String url =company.profile.contains("http")?
              // 'http://vindorlist.sourcecode-ai.com/storage/${company.profile}'; //?subject= ad\&body=<body>
                  "${company.profile}":"http://${company.profile}"; //?subject= ad\&body=<body>
            try {
                print(url);
                await launch(url);
              }
              catch(e) {
              print(e);
                print(url);
                print("failed");

                AwesomeDialog(context: context,dialogType: DialogType.WARNING,body:    Text(

                    english?"Sorry no Url exist":"عذراً لا يوجد رابط",
                    style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14)
                ),)..show();
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 2 / 3,
              height: MediaQuery.of(context).size.height * 2.35 / 32,
              decoration: BoxDecoration(
                color: Color(0xFF2EA5C3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: language
                    ? Text(
                  "View Company Profile",
                  style: TextStyle(color: Colors.white),
                )
                    : Text(
                  "عرض الصفحة الشخصية للشركة",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.25 / 32),

          ///Ad
          // Expanded(
          //   flex: 1,
          //   child: ads.length != 0
          //       ? AutoSizeText(
          //           language ? ads[0].titleEn : ads[0].titleAr,
          //           textDirection:
          //               language ? TextDirection.ltr : TextDirection.rtl,
          //           textAlign: TextAlign.start,
          //           //
          //           style: TextStyle(
          //               fontSize: language ? 10 : 5,
          //               fontWeight: FontWeight.w100,
          //               color: Colors.black.withOpacity(0.3)),
          //         )
          //       : Container(),
          // ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.25 / 32),

          Expanded(
            flex: 4,
            child: new Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Add(
                    image: ads[index].image,
                    height: MediaQuery.of(context).size.height / 4 -
                        MediaQuery.of(context).size.height / 60,
                    text: language ? ads[index].titleEn : ads[index].titleEn,
                    comany_list: false);
              },
              itemCount: ads.length,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
            ),
          ),
        ],
      ),
    );
  }
}