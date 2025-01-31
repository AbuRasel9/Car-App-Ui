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
      backgroundColor: const Color(0xff242C3B),
      appBar: AppBar(
        backgroundColor: const Color(0xff242C3B),
        title: const Text(
          "Choose Your Bike",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff34C8E8),
                  Color(0xff4E4AF2),
                ],
              ),
            ),
            child: const Icon(
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
            height: MediaQuery.of(context).size.height,
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
                  height: MediaQuery.of(context).size.height / 1.2),
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
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff222834),
                      const Color(0xff353F54).withOpacity(.7),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GridView.builder(


            padding: const EdgeInsets.all(16),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .7,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 10, // Adjust this value to decrease the bottom space
            ),
            itemBuilder: (BuildContext context, int index) {
              return ClipPath(
                clipper: CardClipper(),
                child: Container(
                  color: Colors.green,

                ),
              );
            },
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

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 15, size.height - 50);
    path.quadraticBezierTo(size.width, size.height - 50, size.width, size.height - 65);

    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width, 0, size.width - 20, 0);

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
    path.moveTo(10, 40);
    path.quadraticBezierTo(0, 40, 0, 70);

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);

    path.lineTo(size.width - 10, size.height - 40);
    path.quadraticBezierTo(size.width, size.height - 40, size.width, size.height - 60);

    path.lineTo(size.width, 20);
    path.quadraticBezierTo(size.width, 0, size.width - 20, 0);

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