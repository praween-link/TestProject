import 'package:flutter/material.dart';

class MyClippers extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);

    path.quadraticBezierTo(size.width * 0.05, size.height * 0.60,
        size.width * 0.25, size.height * 0.60);

    path.quadraticBezierTo(size.width * 0.75, size.height * 0.60,
        size.width * 0.75, size.height * 0.60);

    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.60, size.width, size.height);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

