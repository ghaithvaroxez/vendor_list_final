import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';
import 'package:vendor_list/screens/company_list/view/companyList.dart';
import 'package:vendor_list/screens/search/model/vendors_search_response.dart';
import 'package:vendor_list/widgets/widgets.dart';

class myHomeBody extends StatelessWidget {
  List<Vendor> vendors;
  Function refresh;
  myHomeBody(this.vendors,this.refresh);

  Widget _buildItem(
      BuildContext context,
      int index,
      
      ) {
    bool k = false;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => CompanyList(
                  section: vendors[index].name,
                  id: vendors[index].id,
                )))).then((value) => refresh);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        // height: 250,
        width: 50,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width / 16),
        //color: Colors.yellow,
        child: Column(
          children: [
            Container(
              height: 50,
              child: CachedNetworkImage(
                imageUrl:
                "http://vindorlist.sourcecode-ai.com/storage/${vendors[index].image}",
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
              height: 10,
            ),

            ///name overflow
            // Text(
            //   vendors[index].name+"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
            //   style: TextStyle(color: Colors.black.withOpacity(0.8)),
            // ),

            // Expanded(
            //   child: ReadMoreText(
            //     vendors[index].name,
            //     style: TextStyle(color: Colors.black,fontSize: 15),
            //     trimLines: 3,
            //     colorClickableText: Colors.blue.withOpacity(0.5),
            //     trimMode: TrimMode.Line,
            //     trimCollapsedText: english?'Show more':'عرض اكثر',
            //     trimExpandedText: english?'Show less':'عرض اقل',
            //     moreStyle: TextStyle(color: Colors.blue.withOpacity(0.5)),
            //     delimiterStyle: TextStyle(color: Colors.blue),
            //   ),
            // ),
            Expanded(
              child: AutoSizeText(
                vendors[index].name,
                minFontSize: 10,
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 1
            ),
            itemCount: vendors.length,
            itemBuilder: (context, index) => _buildItem(context, index)));
  }
}