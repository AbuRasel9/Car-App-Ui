import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff242C3B),
      appBar: AppBar(
        backgroundColor: Color(0xff242C3B),
        title: Text(
          "Choose Your Bike",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xff34C8E8),
                  Color(0xff4E4AF2),
                ],
              ),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(

            width: double.infinity,
            height: MediaQuery
                .of(context)
                .size
                .height,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: BottomContainerClipper(),
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff4B4CED),
                        Color(0xff37B6E9),
                      ])),
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 1.2),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipPath(
              clipper: TopContainerClipper(),
              child: Container(
                height: 240, // Ensure height is enough
                width: double.infinity, // Ensure full width
                decoration: BoxDecoration(
                  color: Colors.red
               /*   gradient: LinearGradient(
                    colors: [
                      Color(0xff222834),

                      Color(0xff353F54).withOpacity(.7),
                    ],
                  ),*/
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipPath(
              clipper: CardClipper(),
              child: Container(
                color: Colors.green,
                width: 200,
                height: 240,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class TopContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(20, 0);
    path.quadraticBezierTo(0, 0, 0, 20);

    path.lineTo(0, size.height-20);
    path.quadraticBezierTo(0, size.height,20 , size.height);

    path.lineTo(size.width-15, size.height-50);
    path.quadraticBezierTo(size.width, size.height-50,size.width , size.height-65);


    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width, 0,size.width-20 , 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(20, 0);
    path.quadraticBezierTo(0, 0, 0, 20);

    path.lineTo(0, size.height-20);
    path.quadraticBezierTo(0, size.height,20 , size.height);

    path.lineTo(size.width-15, size.height-50);
    path.quadraticBezierTo(size.width, size.height-55,size.width , size.height-65);


    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width, 0,size.width-20 , 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}






class BottomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 80);
    path.quadraticBezierTo(size.width / 1, 80, size.width / 1.3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
