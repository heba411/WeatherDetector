import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget weatherDetail(IconData icon, String value, String label) {
  return Column(
    children: [
      Icon(icon, color: Colors.white, size: 28),
      Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      Text(label, style: TextStyle(fontSize: 14, color: Colors.white70)),
    ],
  );
}