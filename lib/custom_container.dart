import 'dart:ui';

import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 190); 

    final waveControlPoint1 = Offset(size.width / 3, size.height - 40);
    final waveEndPoint1 = Offset(size.width / 1, size.height - 160);
    path.quadraticBezierTo(
        waveControlPoint1.dx, waveControlPoint1.dy, waveEndPoint1.dx, waveEndPoint1.dy);

    final waveControlPoint2 = Offset(size.width *  8, size.height - 150);
    final waveEndPoint2 = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(
        waveControlPoint2.dx, waveControlPoint2.dy, waveEndPoint2.dx, waveEndPoint2.dy);

    path.lineTo(size.width, 0); 
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true; 
  }
}

