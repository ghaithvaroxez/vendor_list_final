import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:vendor_list/screens/company_list/model/company_list_response.dart';
import 'package:vendor_list/screens/home/model/home_response.dart';
import 'package:vendor_list/widgets/widgets.dart';

import 'card_button.dart';

class mycompanyListBody extends StatelessWidget {
  List<Advert> ads;
  String section;
  BuildContext context;
  List<Company> companies = [];
  bool language;
  mycompanyListBody({this.context, this.section, this.companies, this.ads,this.language});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        ///Ad
        ads.length != 0
            ? Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Add(
                      image: ads[index].image,
                      height: MediaQuery.of(context).size.height / 4 -
                          MediaQuery.of(context).size.height / 60,
                      text: language


                          ? ads[index].titleEn
                          : ads[index].titleEn,
                      comany_list: true);
                },
                itemCount: ads.length,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
              ),
            ),
          ],
        )
            : Container(),
        SizedBox(
          height: 2,
        ),

        Expanded(
            child: ListView.builder(
              itemCount: companies.length,
              itemBuilder: (context, index) => cardButton(
                context: context,
                company: companies[index],
                section: section,
                s: true,
                language: language,),
            )),
      ]),
    );
  }
}