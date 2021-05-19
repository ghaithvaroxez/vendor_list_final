import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vendor_list/screens/search/view/search_screen.dart';

class myAppBAr extends StatelessWidget {
  bool home;
  String title;
  BuildContext context;
  bool Search = false;
  bool language;
  myAppBAr({Key key, this.home, this.title, this.context, this.Search,this.language}) {
    if (Search == null) Search = false;
  }

  Widget _buildAppBarButton(
      BuildContext context, String image, double width, bool back) {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 32,
      width: width,
      color: back ? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0),
      child: Center(
        child: Image(
          height: back ? 22 : 45,
          width: back ? 26 : 45,
          fit: BoxFit.fitWidth,
          image: AssetImage(image),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 3.2 / 32,
      // height: 80,
      color: Color(0xFF2EA5C3),
      child: language
          ?
      //english
      Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: _buildAppBarButton(
                        context,
                        'assets/2/icon1.png',
                        MediaQuery.of(context).size.width * 4 / 32,
                        false),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8 / 32,
                  ),
                  !Search
                      ? GestureDetector(
                    onTap: () {
                      // showSearch(
                      //     context: context, delegate: DataSearch());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  SearchScreen())));
                    },
                    child: _buildAppBarButton(
                        context,
                        'assets/2/icon2.png',
                        MediaQuery.of(context).size.width * 4 / 32,
                        false),
                  )
                      : Container(),
                ],
              ),
            ],
          ),
          home
              ?

          //title without button
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            5.5 /
                            32,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            1 /
                            32,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            16 /
                            32,
                        child: AutoSizeText(
                          title,
                          textScaleFactor: 1.8,
                          textDirection: TextDirection.rtl,
                          // minFontSize: 20,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 32,
                  // ),
                ]),
              ])
              :
          //title without button

          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 32,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            1 /
                            32,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            11.5 /
                            32,
                        child: AutoSizeText(
                          title,
                          textScaleFactor: 1.5,

                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width:
                    MediaQuery.of(context).size.width * 4 / 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: _buildAppBarButton(
                      context,
                      language
                          ? 'assets/2/icon3.png'
                          : 'assets/3/2.png',
                      MediaQuery.of(context).size.width * 3.66 / 32,
                      true,
                    ),
                  ),
                ]),
              ]),
        ],
      )
          :
      //arabic
      Row(
        children: [
          home
              ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            1 /
                            32,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            16 /
                            32,
                        child: AutoSizeText(
                          title,
                          textDirection: TextDirection.rtl,
                          // minFontSize: 24,
                          textScaleFactor: 1.8,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 32,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        5.5 /
                        32,
                  ),
                ]),
              ])
              : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: _buildAppBarButton(
                      context,
                      'assets/3/2.png',
                      MediaQuery.of(context).size.width * 3.66 / 32,
                      true,
                    ),
                  ),
                  SizedBox(
                    width:
                    MediaQuery.of(context).size.width * 4 / 32,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            1 /
                            32,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            11.5 /
                            32,
                        child: AutoSizeText(
                          title,
                          textScaleFactor:1.5 ,
                          textDirection: TextDirection.rtl,
                          maxLines: 1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width:
                    MediaQuery.of(context).size.width * 2 / 32,
                  ),
                ]),
              ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SearchScreen())));
                    },
                    child: _buildAppBarButton(
                        context,
                        'assets/2/icon2.png',
                        MediaQuery.of(context).size.width * 4 / 32,
                        false),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8 / 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: _buildAppBarButton(
                        context,
                        'assets/2/icon1.png',
                        MediaQuery.of(context).size.width * 4 / 32,
                        false),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );}
}