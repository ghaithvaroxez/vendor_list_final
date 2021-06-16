import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_list/helper/size_config.dart';
import 'package:vendor_list/screens/company_list/view/companyList.dart';
import 'package:vendor_list/widgets/widgets.dart';

class VendorCard extends StatelessWidget {
  String img;
  String title;
Function ontap;
int id;
BuildContext cc;
  VendorCard({this.title, this.img,this.ontap,this.id,this.cc});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
        onTap:(){
        Navigator.of(context).push(  MaterialPageRoute(
            builder: ((context) => CompanyList(
              section: title,
              id:id,
            ))));
        },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        width: getProportionateScreenWidth(170),
        height: getProportionateScreenHeight(200),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 0.3, color: Colors.blue.withOpacity(0.8)),
            color: Colors.white),
        child: Stack(
          children: [
            Positioned(
                // left: 15,
                bottom: getProportionateScreenHeight(60),
                child: Container(
                  height: getProportionateScreenHeight(139.7),
                  width: getProportionateScreenWidth(169.7),
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    child:CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                      "http://vindorlist.sourcecode-ai.com/storage/$img",
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
                )),

            ///photo

            Positioned(
              top: getProportionateScreenHeight(140),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: getProportionateScreenHeight(59.7),
                width: getProportionateScreenWidth(170),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                  color:Color(0xFF2EA5C3),
                  // color:Color(0xFF2EA5C3),
                  // color: Colors.red,
                ),
                child: Center(
                  child: AutoSizeText(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    textDirection: english ? TextDirection.ltr : TextDirection.rtl,
                  ),
                ),
              ),
            ),

            ///grey footer
          ],
        ),
      ),
    );
  }
}
