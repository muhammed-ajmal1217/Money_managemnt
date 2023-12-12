import 'package:flutter/material.dart';

LinearGradient mainContainerGradient() {
  return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromARGB(255, 16, 152, 173).withOpacity(0.1),
        Color.fromARGB(255, 2, 151, 177).withOpacity(0.2),
        Color.fromARGB(255, 37, 211, 242).withOpacity(0.3),
      ]);
}
