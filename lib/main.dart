import 'package:flutter/material.dart';
import 'package:merawall/screens/wallpaperscreens.dart';

void main() {
  runApp(const Merawall());
}
//unsplash =R2voATnea7BM9_6MX64d9dTjXW35U8edfthvsWrVYT4 a
class Merawall extends StatelessWidget {
  const Merawall({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: wallpaperscreen(),
    );
  }
}


