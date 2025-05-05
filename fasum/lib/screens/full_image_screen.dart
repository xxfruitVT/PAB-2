import 'dart:convert';

import 'package:flutter/material.dart';

class FullscreenImageScreen extends StatelessWidget {
  final String imageBase64;

  const FullscreenImageScreen({
    super.key, 
    required this.imageBase64,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: InteractiveViewer(
            child: Image.memory(
              base64Decode(imageBase64),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}