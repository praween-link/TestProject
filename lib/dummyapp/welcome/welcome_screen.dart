import 'package:dummyapp/dummyapp/data/data_controller.dart';
import 'package:dummyapp/dummyapp/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Data>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/my/welcome.png', fit: BoxFit.fill),
          ClipPath(
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFF480c96),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 140, bottom: 20, left: 50.0, right: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hello!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Let's help us to some quick questions...",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "Help us with a couple of questions and earn points!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeNmae);
                        provider.addTopicsInList();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 90,
                          right: 90,
                        ),
                        child: Text(
                          'Start Now',
                          style: TextStyle(
                              color: Color(0xFF480c96),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                        primary: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            clipper: MyClipper(),
          )
        ],
      ),
    ); //bottomWaveDesigns()
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.quadraticBezierTo(size.width * 0.95, size.height * 0.20,
        size.width * 0.75, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.20,
        size.width * 0.25, size.height * 0.20);
    path.quadraticBezierTo(
        size.width * 0.05, size.height * 0.20, 0, size.height * 0.4);
    path.lineTo(0, size.height * 0.4);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
