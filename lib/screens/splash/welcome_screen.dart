import 'package:flutter/material.dart';
import 'package:vendor_list/helper/sharedpref_helper.dart';
import 'package:vendor_list/widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    languagemethod();
    super.initState();
  }
  languagemethod()async
  {
    await SharedPreferenceHelper.firstTime()?await SharedPreferenceHelper.saveLanguage(false):english=await SharedPreferenceHelper.getLanguage();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Container(
          height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
          color: Color(0xFF2EA5C3),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/2.8,),
        Image(
                  image: AssetImage('assets/1/1.png'),
                ),
              Spacer(),
              Text("Vendor list v1.0",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 12), ),
              SizedBox(height: MediaQuery.of(context).size.height/10,),

            ],
          ),
        ),
        // Stack(
        //   children: [
        //     Container(
        //       height: MediaQuery.of(context).size.height,
        //       width: MediaQuery.of(context).size.width,
        //       color: Color(0xFF2EA5C3),
        //     ),
        //     Positioned(
        //       left: 0,
        //       right: 0,
        //       top: 0,
        //       bottom: 0,
        //       child: Image(
        //         image: AssetImage('assets/1/1.png'),
        //       ),
        //     ),
        //     Container(
        //       child: Positioned(
        //         left: 0,
        //         right: 0,
        //         top: 0,
        //         bottom: -MediaQuery.of(context).size.height +
        //             MediaQuery.of(context).size.height * 2 / 8,
        //         child: Container(child: Text("Vendor list v1.0",style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 18), )),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

// Column(
//           children: [
//             Spacer(
//               flex: 1,
//             ),
//             Row(
//               children: [
//                 Spacer(
//                   flex: 1,
//                 ),
//                 Image(
//                   image: AssetImage('assets/1/icon1.png'),
//                 ),
//                 Spacer(
//                   flex: 1,
//                 ),
//               ],
//             ),
//             Spacer(
//               flex: 1,
//             ),
//             Image(
//               image: AssetImage('assets/1/icon2.png'),
//             ),
//             SizedBox(
//               height: 60,
//             )
//           ],
//         ),
