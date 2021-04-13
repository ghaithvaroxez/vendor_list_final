import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF2EA5C3),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Image(
                image: AssetImage('assets/1/1.png'),
              ),
            ),
            Container(
              child: Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: -MediaQuery.of(context).size.height +
                    MediaQuery.of(context).size.height * 2 / 8,
                child: Image(
                  image: AssetImage('assets/1/2.png'),
                ),
              ),
            ),
          ],
        ),
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
