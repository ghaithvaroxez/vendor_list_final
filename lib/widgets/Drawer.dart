import 'package:flutter/material.dart';
import 'package:vendor_list/screens/about/view/about.dart';
import 'package:vendor_list/screens/contact/view/contact.dart';
import 'package:vendor_list/screens/saved_companies/views/saved_companies_screen.dart';

class myDrawer extends StatelessWidget  {
  BuildContext context;
  int layer;
  Function changeLanguage;
  bool language;
  myDrawer({this.context, this.layer, @required this.changeLanguage,this.language});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color(0xFF2EA5C3),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,

                      image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/1/1.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ///home page condition
            // (layer != 1)
            //     ?
            ListTile(
              leading: Icon(
                Icons.home_outlined,
              ),
              title: language
                  ? Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF595959),
                ),
              )
                  : Text(
                'الرئيسية',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF595959),
                ),
              ),
              onTap: () {
                // for (int i = 0; i < layer; i++) Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            //: Opacity(opacity: 0),
            ListTile(
              leading: Icon(Icons.replay_outlined),
              title: language
                  ? Text(
                'Saved',
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 18,
                ),
              )
                  : Text(
                'الشركات المحفوظة',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => SavedCompaniesScreen(language
                            ? "Saved Companies"
                            : "الشركات المحفوظة"))));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support_outlined),
              title: language
                  ? Text(
                'Contact',
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 18,
                ),
              )
                  : Text(
                'التواصل',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Color(0xFF595959),
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ContactScreen())));
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: language
                  ? Text(
                'About',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF595959),
                ),
              )
                  : Text(
                ' حَول التطبيق',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF595959),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>AboutScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.translate_outlined),
              title: language
                  ? Text(
                'Language',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF595959),
                ),
              )
                  : Text(
                'اللغة',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF595959),
                ),
              ),
              onTap: changeLanguage,

              // Navigator.of(context).pushNamed('/strategies');
            )
            ,

            // Spacer(),
            // Row(
            //   children: [
            //     SocialMediaButton.facebook(
            //       url: "https://twitter.com/CipliOnat",
            //       // size: 35,
            //       color: Colors.blue,
            //     ),
            //     SocialMediaButton.instagram(
            //       url: "https://twitter.com/CipliOnat",
            //       // size: 35,
            //
            //       color: Color(0xFF595959)
            //     ),
            //     SocialMediaButton.linkedin(
            //       url: "https://twitter.com/CipliOnat",
            //       // size: 35,
            //       color: Colors.blue,
            //     ),
            //
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}